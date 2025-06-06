extends MarginContainer

var price: int
var menu_inn: Control

func _on_button_pressed() -> void:
	Inns.rest(price)
	menu_inn.update_money()
	menu_inn.update_character_panels()

func set_text(text: String) -> void:
	$MarginContainer/HBoxContainer/LabelName.text = text

func set_price(_price: int) -> void:
	price = _price
	update_price()

func update_price() -> void:
	$MarginContainer/HBoxContainer/LabelPrice.text = str(price)
