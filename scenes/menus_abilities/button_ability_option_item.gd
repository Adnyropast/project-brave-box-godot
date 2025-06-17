extends Button

var menu_abilities: Control
var ability: ActiveAbility

func _on_pressed() -> void:
	menu_abilities.equip_ability(ability)
