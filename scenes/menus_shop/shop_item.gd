extends MarginContainer

var item: Item
var menu_shop: Control

func _on_button_pressed() -> void:
	Shops.purchase_item(item)
	
	menu_shop.update_money()
	update_owned()

func set_item(_item: Item) -> void:
	item = _item
	update_text()
	update_price()
	update_owned()

func update_text() -> void:
	$MarginContainer/HBoxContainer/LabelName.text = item.name

func update_price() -> void:
	$MarginContainer/HBoxContainer/LabelPrice.text = str(item.price)

func update_owned() -> void:
	$MarginContainer/HBoxContainer/MarginContainer/LabelOwned.text = str(PlayerInventory.get_count(item))
