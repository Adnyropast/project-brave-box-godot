extends Control

var menu_battle: Control
var pawn: PawnComponents

func fill_buttons():
	for target in pawn.allies:
		var button = preload("res://scenes/menus_battle/menus_target/button_target_single.tscn").instantiate()
		
		button.text = target.variables.name_alias
		button.pawn = pawn
		button.target = target
		button.menu_target = self
		
		$MarginContainer/VBoxContainer/VBoxContainer/Allies/VBoxContainer.add_child(button)
	
	for target in pawn.enemies:
		var button = preload("res://scenes/menus_battle/menus_target/button_target_single.tscn").instantiate()
		
		button.text = target.variables.name_alias
		button.pawn = pawn
		button.target = target
		button.menu_target = self
		
		$MarginContainer/VBoxContainer/VBoxContainer/Enemies/VBoxContainer.add_child(button)

func place_ally_targets_first():
	$MarginContainer/VBoxContainer/VBoxContainer.move_child($MarginContainer/VBoxContainer/VBoxContainer/Allies, 0)

func place_enemy_targets_first():
	$MarginContainer/VBoxContainer/VBoxContainer.move_child($MarginContainer/VBoxContainer/VBoxContainer/Enemies, 0)

func close_menu():
	get_parent().remove_child(self)

func _ready() -> void:
	place_ally_targets_first()
	place_enemy_targets_first()
	fill_buttons()

func _on_button_all_pressed() -> void:
	close_menu()
	
	var targets = pawn.turn_system.pawns
	
	pawn.confirm_targets(targets)

func _on_button_all_allies_pressed() -> void:
	close_menu()
	
	var targets = pawn.allies
	
	pawn.confirm_targets(targets)

func _on_button_all_enemies_pressed() -> void:
	close_menu()
	
	var targets = pawn.enemies
	
	pawn.confirm_targets(targets)

func _on_button_cancel_pressed() -> void:
	var tree = get_tree()
	
	close_menu()
	
	tree.root.add_child(menu_battle)
