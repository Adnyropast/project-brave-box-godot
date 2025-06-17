extends Button

var menu_abilities: Control
var party_member: PartyMemberVariables

func _on_pressed() -> void:
	menu_abilities.set_selected_party_member(party_member)
