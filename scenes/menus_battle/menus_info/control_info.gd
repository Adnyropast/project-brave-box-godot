extends Control

var battle: Node
var pawns: Array[PawnComponents]

func _shortcut_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		open_menu()

func open_menu():
	var menu = preload("res://scenes/menus_battle/menus_info/menu_info.tscn").instantiate()
	menu.battle = battle
	menu.pawns = pawns
	get_tree().paused = true
	Menus.open_menu(menu)
	battle.hide_ui()
