extends MarginContainer

var menu_change_weapon: Control
var item_variables: ItemVariables

func _on_button_pressed() -> void:
	menu_change_weapon.set_weapon(item_variables.item)

func set_item_variables(_item_variables: ItemVariables) -> void:
	item_variables = _item_variables
	update_text()
	update_count()

func update_text() -> void:
	$MarginContainer/HBoxContainer/LabelName.text = item_variables.item.name

func update_count() -> void:
	$MarginContainer/HBoxContainer/LabelCount.text = "× " + str(item_variables.count)
