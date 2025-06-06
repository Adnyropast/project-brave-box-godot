extends Button

var menu_poi: Control

func _on_pressed() -> void:
	Menus.close_menu(menu_poi)
	
	var menu = preload("res://scenes/menus_inn/menu_inn.tscn").instantiate()
	menu.menu_poi = menu_poi
	Menus.open_menu(menu)
