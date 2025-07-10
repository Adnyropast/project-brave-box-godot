extends Control

var menu_cancel: Control
var pawn: PawnComponents
var active_ability: ActiveAbility

func _init() -> void:
	FocusButtons.set_focus_on_draw(self)

func fill_buttons():
	for target in pawn.allies:
		var button = preload("res://scenes/menus_battle/menus_target/button_target_single.tscn").instantiate()
		
		button.text = target.variables.name_alias
		button.pawn = pawn
		button.target = target
		button.menu_target = self
		button.active_ability = active_ability
		
		$MarginContainer/VBoxContainer/VBoxContainer/Allies/VBoxContainer.add_child(button)
	
	for target in pawn.enemies:
		var button = preload("res://scenes/menus_battle/menus_target/button_target_single.tscn").instantiate()
		
		button.text = target.variables.name_alias
		button.pawn = pawn
		button.target = target
		button.menu_target = self
		button.active_ability = active_ability
		
		$MarginContainer/VBoxContainer/VBoxContainer/Enemies/VBoxContainer.add_child(button)

func fill_button_self():
	var button = preload("res://scenes/menus_battle/menus_target/button_target_single.tscn").instantiate()
	
	button.text = pawn.variables.name_alias
	button.pawn = pawn
	button.target = pawn
	button.menu_target = self
	button.active_ability = active_ability
	
	$MarginContainer/VBoxContainer/VBoxContainer/Allies/VBoxContainer.add_child(button)

func place_ally_targets_first():
	$MarginContainer/VBoxContainer/VBoxContainer.move_child($MarginContainer/VBoxContainer/VBoxContainer/Allies, 0)

func place_enemy_targets_first():
	$MarginContainer/VBoxContainer/VBoxContainer.move_child($MarginContainer/VBoxContainer/VBoxContainer/Enemies, 0)

func close_menu():
	get_parent().remove_child(self)

func _ready() -> void:
	place_ally_targets_first()
	place_enemy_targets_first()
	
	if active_ability.targets_self():
		fill_button_self()
	
	if active_ability.can_target_single():
		fill_buttons()
	
	if not active_ability.can_target_multiple():
		hide_buttons_all()
	
	if not active_ability.can_target_allies_and_enemies():
		hide_buttons_all_allies_and_enemies()

func _on_button_all_pressed() -> void:
	close_menu()
	
	var targets = pawn.turn_system.pawns.duplicate()
	
	pawn.confirm_targets(active_ability, targets)

func _on_button_all_allies_pressed() -> void:
	close_menu()
	
	var targets = pawn.allies.duplicate()
	
	pawn.confirm_targets(active_ability, targets)

func _on_button_all_enemies_pressed() -> void:
	close_menu()
	
	var targets = pawn.enemies.duplicate()
	
	pawn.confirm_targets(active_ability, targets)

func _on_button_cancel_pressed() -> void:
	Menus.switch_menus(self, menu_cancel)

func hide_buttons_all():
	$MarginContainer/VBoxContainer/VBoxContainer/Allies/ButtonAllAllies.hide()
	$MarginContainer/VBoxContainer/VBoxContainer/Enemies/ButtonAllEnemies.hide()

func hide_buttons_all_allies_and_enemies():
	$MarginContainer/VBoxContainer/ButtonAll.hide()
