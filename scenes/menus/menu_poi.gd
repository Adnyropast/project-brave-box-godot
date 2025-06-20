extends Control

var tree: SceneTree
var point_of_interest: PointOfInterest

func add_buttons():
	if(point_of_interest):
		if point_of_interest.inn:
			var button = preload("res://scenes/menus/button_inn.tscn").instantiate()
			
			button.text = "Inn"
			button.menu_poi = self
			
			$MarginContainer/VBoxContainer/VBoxContainer.add_child(button)
		
		for shop in point_of_interest.shops:
			var button = preload("res://scenes/menus/button_shop.tscn").instantiate()
			
			button.text = shop.name
			button.shop = shop
			button.menu_poi = self
			
			$MarginContainer/VBoxContainer/VBoxContainer.add_child(button)
		
		if point_of_interest.data_battles:
			var button = preload("res://scenes/menus/button_data_battles.tscn").instantiate()
			
			button.menu_poi = self
			
			$MarginContainer/VBoxContainer/VBoxContainer.add_child(button)
		
		var next_missions: Array[Mission] = PlayerMissions.filter_next_missions(point_of_interest.missions)
		var completed_missions: Array[Mission] = PlayerMissions.filter_missions_cleared(point_of_interest.missions)
		
		for mission in next_missions:
			var button = preload("res://scenes/menus/button_mission.tscn").instantiate()
			
			button.text = mission.title
			button.mission = mission
			button.show_mark_new()
			
			$"MarginContainer/VBoxContainer/VBoxContainer".add_child(button)
		
		if completed_missions.size() > 0:
			var button = preload("res://scenes/menus/button_completed_missions.tscn").instantiate()
			
			button.missions = completed_missions
			button.menu_poi = self
			
			$MarginContainer/VBoxContainer/VBoxContainer.add_child(button)

func _ready() -> void:
	add_buttons()

func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("cancel")):
		close_menu()

func close_menu():
	tree.root.remove_child(self)
	tree.paused = false

func _on_tree_entered() -> void:
	tree = get_tree()
	tree.paused = true

func _on_button_close_pressed() -> void:
	close_menu()
