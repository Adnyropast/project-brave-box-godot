extends Button

var menu_poi: Control
var missions: Array[Mission]

func _on_pressed() -> void:
	Menus.close_menu(menu_poi)
	
	var menu = preload("res://scenes/menus_list_missions/menu_list_missions.tscn").instantiate()
	
	menu.menu_cancel = menu_poi
	menu.missions = missions
	
	Menus.open_menu(menu)
