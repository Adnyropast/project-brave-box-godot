extends Control

var battle: Node
var pawns: Array[PawnComponents]

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("cancel"):
		open_menu()

func open_menu():
	var menu = preload("res://scenes/menus_battle/menus_info/menu_info.tscn").instantiate()
	menu.battle = battle
	menu.pawns = pawns
	get_tree().paused = true
	Menus.open_menu(menu)
	battle.hide_ui()
