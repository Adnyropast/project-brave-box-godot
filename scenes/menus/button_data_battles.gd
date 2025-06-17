extends Button

var menu_poi: Control

func _on_pressed() -> void:
	Menus.close_menu(menu_poi)
	
	var menu = preload("res://scenes/menus_data_battles/menu_data_battles.tscn").instantiate()
	menu.menu_cancel = menu_poi
	Menus.open_menu(menu)
