extends Control

var menu_node: Node
var menu_node_parent: Node

func init_menu_node():
	menu_node_parent = get_tree().root
	menu_node = preload("res://scenes/menus_pause/menu_pause.tscn").instantiate()

func _ready() -> void:
	init_menu_node()

func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("cancel")):
		open_menu()
	
	pass

func open_menu():
	menu_node_parent.add_child(menu_node)
