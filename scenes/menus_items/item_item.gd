extends MarginContainer

var iv: ItemVariables

func set_item(_iv: ItemVariables) -> void:
	iv = _iv
	update_text()
	update_count()

func update_text() -> void:
	$MarginContainer/HBoxContainer/LabelName.text = iv.item.name

func update_count() -> void:
	$MarginContainer/HBoxContainer/LabelCount.text = str(iv.count)
