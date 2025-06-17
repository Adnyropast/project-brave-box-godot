extends Button

var menu_data_battles: Control
var slot: int

func _on_pressed() -> void:
	menu_data_battles.set_selected_slot(slot)
