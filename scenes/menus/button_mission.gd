extends Button

var mission: Mission
var tree: SceneTree

func clean_tree_root():
	for child in tree.root.get_children():
		tree.root.remove_child(child)

func _on_pressed() -> void:
	tree = get_tree()
	
	tree.change_scene_to_packed(mission.battle.arena)
	
	clean_tree_root()
	
	var menu_node = preload("res://scenes/menus_battle/menu_battle.tscn").instantiate()
	tree.root.add_child(menu_node)
