class_name TargetMenu
extends Node

static func open_menu_target(
	menu_cancel: Control,
	pawn: PawnComponents,
	active_ability: ActiveAbility,
) -> void:
	var menu_target = preload("res://scenes/menus_battle/menus_target/menu_target.tscn").instantiate()
	
	menu_target.menu_cancel = menu_cancel
	menu_target.pawn = pawn
	menu_target.active_ability = active_ability
	
	Menus.switch_menus(menu_cancel, menu_target)
