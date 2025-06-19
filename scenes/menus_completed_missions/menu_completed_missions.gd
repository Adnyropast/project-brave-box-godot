extends Control

var menu_cancel: Control
var missions: Array[Mission]

func _ready() -> void:
	fill_buttons()

func _on_button_close_pressed() -> void:
	Menus.close_menu(self)
	Menus.open_menu(menu_cancel)

func fill_buttons() -> void:
	var container = $MarginContainer/VBoxContainer/VBoxContainerButtons
	
	for mission in missions:
		var button = preload("res://scenes/menus/button_mission.tscn").instantiate()
		
		button.text = mission.title
		button.mission = mission
		
		container.add_child(button)
