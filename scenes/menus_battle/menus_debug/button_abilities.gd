extends Button

var menu_cancel: Control
var pawn: PawnComponents
var abilities: Array[ActiveAbility]

func _on_pressed() -> void:
	open_menu_abilities(abilities)

func open_menu_abilities(_abilities: Array[ActiveAbility]) -> void:
	Menus.close_menu(menu_cancel)
	
	var menu_abilities = preload("res://scenes/menus_battle/menus_abilities/menu_abilities.tscn").instantiate()
	
	menu_abilities.menu_cancel = menu_cancel
	menu_abilities.pawn = pawn
	menu_abilities.update_abilities(_abilities)
	
	Menus.open_menu(menu_abilities)
