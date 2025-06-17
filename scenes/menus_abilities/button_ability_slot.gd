extends Button

var menu_abilities: Control
var slot_index: int

func _on_pressed() -> void:
	menu_abilities.set_selected_ability_slot(slot_index)
