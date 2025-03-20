extends Control

var tree: SceneTree
var point_of_interest: PointOfInterest

func add_buttons():
	if(point_of_interest):
		for mission in point_of_interest.missions:
			var button = preload("res://scenes/menus/button_mission.tscn").instantiate()
			
			button.text = mission.title
			button.mission_key = mission.title
			
			$"MarginContainer/VBoxContainer/VBoxContainer".add_child(button)

func _ready() -> void:
	add_buttons()

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
