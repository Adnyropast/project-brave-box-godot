extends Control

var shop: Shop
var menu_poi: Control

func _ready() -> void:
	update_money()
	fill_items()

func _on_button_close_pressed() -> void:
	Menus.close_menu(self)
	Menus.open_menu(menu_poi)

func update_money() -> void:
	$MarginContainer2/PanelContainer/MarginContainer/HBoxContainer/LabelMoney.text = str(PlayerParty.money)

func fill_items() -> void:
	for item in shop.items:
		var shop_item = preload("res://scenes/menus_shop/shop_item.tscn").instantiate()
		
		shop_item.menu_shop = self
		shop_item.set_item(item)
		
		$MarginContainer/VBoxContainer/VBoxContainer.add_child(shop_item)
