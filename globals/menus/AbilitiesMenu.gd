class_name AbilitiesMenu
extends Node

static func open_menu_abilities(
	menu_cancel: Control,
	pawn: PawnComponents,
	abilities: Array[ActiveAbility],
) -> void:
	var menu_abilities = preload("res://scenes/menus_battle/menus_abilities/menu_abilities.tscn").instantiate()
	
	menu_abilities.menu_cancel = menu_cancel
	menu_abilities.pawn = pawn
	menu_abilities.update_abilities(abilities)
	
	Menus.switch_menus(menu_cancel, menu_abilities)
