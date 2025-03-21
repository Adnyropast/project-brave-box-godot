extends Control

var tree: SceneTree

func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("cancel")):
		close_menu()

func close_menu():
	tree.root.remove_child(self)

func _on_tree_entered() -> void:
	tree = get_tree()
	tree.paused = true

func _on_tree_exited() -> void:
	tree.paused = false

func _on_button_close_pressed() -> void:
	close_menu()
