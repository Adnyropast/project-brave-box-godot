extends Button

var menu_stats: Control
var party_member: PartyMember

func _on_pressed() -> void:
	menu_stats.update_stats(party_member)
