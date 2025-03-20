extends Control

var menu_node: Node
var menu_node_parent: Node
var point_of_interest: PointOfInterest

func init_menu_node():
	menu_node_parent = get_tree().root
	menu_node = preload("res://scenes/menus/menu_poi.tscn").instantiate()
	menu_node.point_of_interest = point_of_interest

func _ready() -> void:
	init_menu_node()

func _process(_delta: float) -> void:
	show()
	
	if(Input.is_action_just_pressed("confirm")):
		open_menu()

func open_menu():
	hide()
	
	menu_node_parent.add_child(menu_node)

func _on_button_pressed() -> void:
	open_menu()
	
	pass # Replace with function body.
