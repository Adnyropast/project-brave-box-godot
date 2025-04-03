extends Control

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("confirm")):
		close_screen()

func close_screen():
	var tree = get_tree()
	
	tree.change_scene_to_file("res://scenes/map/map_compositia.tscn")
	
	clean_tree_root()

func _on_button_pressed() -> void:
	close_screen()

func clean_tree_root():
	var tree = get_tree()
	
	for child in tree.root.get_children():
		tree.root.remove_child(child)
