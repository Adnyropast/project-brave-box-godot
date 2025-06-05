extends Control

var menu_pause: Control

func _ready() -> void:
	fill_items()

func _on_button_close_pressed() -> void:
	Menus.close_menu(self)
	Menus.open_menu(menu_pause)

func fill_items() -> void:
	for iv in PlayerInventory.items:
		var item_item = preload("res://scenes/menus_items/item_item.tscn").instantiate()
		
		item_item.set_item(iv)
		
		$ScrollContainer/VBoxContainer.add_child(item_item)
