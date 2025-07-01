extends Control

var pawn: PawnComponents

func _ready() -> void:
	update_button_debug()

func _on_button_attack_pressed() -> void:
	TargetMenu.open_menu_target(
		self,
		pawn,
		preload("res://resources/active_abilities/attack.tres")
	)

func _on_button_abilities_pressed() -> void:
	AbilitiesMenu.open_menu_abilities(
		self,
		pawn,
		pawn.variables.get_active_abilities()
	)

func _on_button_debug_pressed() -> void:
	var menu_debug = preload("res://scenes/menus_battle/menus_debug/menu_debug.tscn").instantiate()
	
	menu_debug.menu_cancel = self
	menu_debug.pawn = pawn
	
	Menus.switch_menus(self, menu_debug)

func _on_button_defend_pressed() -> void:
	Menus.close_menu(self)
	pawn.confirm_targets(
		preload("res://resources/active_abilities/defend.tres"),
		[pawn],
	)

func _on_button_change_weapon_pressed() -> void:
	var menu = preload("res://scenes/menus_battle/menus_change_weapon/menu_change_weapon.tscn").instantiate()
	
	menu.menu_cancel = self
	menu.pawn = pawn
	
	Menus.switch_menus(self, menu)

func _on_button_items_pressed() -> void:
	AbilitiesMenu.open_menu_abilities(
		self,
		pawn,
		ItemAbilities.get_player_item_abilities()
	)

func _on_button_flee_pressed() -> void:
	Menus.close_menu(self)
	pawn.confirm_targets(
		preload("res://resources/active_abilities/flee.tres"),
		pawn.allies.duplicate(),
	)

func update_button_debug() -> void:
	if PlayerSettings.debug_mode:
		$MarginContainer/VBoxContainer/ButtonDebug.show()
	else:
		$MarginContainer/VBoxContainer/ButtonDebug.hide()
