extends Node

class_name Menus

static func open_menu(menu: Node):
	var tree: SceneTree = Engine.get_main_loop()
	
	tree.root.add_child(menu)

static func close_menu(menu: Node):
	var parent: Node = menu.get_parent()
	
	parent.remove_child(menu)

static func switch_menus(menu1: Node, menu2: Node) -> void:
	var parent: Node = menu1.get_parent()
	
	parent.remove_child(menu1)
	parent.add_child(menu2)
