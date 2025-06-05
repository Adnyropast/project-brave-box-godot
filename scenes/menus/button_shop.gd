extends Button

var shop: Shop
var menu_poi: Control

func _on_pressed() -> void:
	Menus.close_menu(menu_poi)
	
	var menu = preload("res://scenes/menus_shop/menu_shop.tscn").instantiate()
	menu.shop = shop
	menu.menu_poi = menu_poi
	Menus.open_menu(menu)
