extends Control

var tree: SceneTree

func clean_tree_root():
	for child in tree.root.get_children():
		tree.root.remove_child(child)

func _on_button_flee_pressed() -> void:
	tree = get_tree()
	
	get_tree().change_scene_to_file("res://scenes/map/map_compositia.tscn")
	
	clean_tree_root()
