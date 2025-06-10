extends Button

var menu_equipment: Control
var party_member: PartyMemberVariables

func _on_pressed() -> void:
	menu_equipment.set_selected_party_member(party_member)
