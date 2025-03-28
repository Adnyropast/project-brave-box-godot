extends Control

var tree: SceneTree
var pawn: PawnComponents

func clean_tree_root():
	for child in tree.root.get_children():
		tree.root.remove_child(child)

func close_menu():
	get_parent().remove_child(self)

func open_menu_target():
	var menu_target = preload("res://scenes/menus_battle/menus_target/menu_target.tscn").instantiate()
	
	menu_target.menu_battle = self
	menu_target.pawn = pawn
	
	tree.root.add_child(menu_target)

func _on_button_target_pressed() -> void:
	tree = get_tree()
	
	close_menu()
	open_menu_target()

func _on_button_pass_pressed() -> void:
	close_menu()
	
	pawn.pass_turn()

func _on_button_flee_pressed() -> void:
	tree = get_tree()
	
	close_menu()
	
	tree.change_scene_to_file("res://scenes/map/map_compositia.tscn")
	
	clean_tree_root()
