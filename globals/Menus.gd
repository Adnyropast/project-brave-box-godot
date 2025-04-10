extends Node

class_name Menus

static func open_menu(menu: Node):
	var tree: SceneTree = Engine.get_main_loop()
	
	tree.root.add_child(menu)

static func close_menu(menu: Node):
	var tree: SceneTree = Engine.get_main_loop()
	
	tree.root.remove_child(menu)
