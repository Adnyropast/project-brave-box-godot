extends Button

var menu_abilities: Control
var ability_set: AbilitySet

func _on_pressed() -> void:
	menu_abilities.fill_abilities_options(ability_set)
