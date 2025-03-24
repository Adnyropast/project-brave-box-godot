extends Button

var team_slot: int
var slot: int
var action_menu: VBoxContainer

func close_menu():
	action_menu.hide()

func _on_pressed() -> void:
	PlayerParty.switch_bench_members(team_slot, slot)
	get_tree().root.get_node("MenuFormation").update_buttons()
	close_menu()
