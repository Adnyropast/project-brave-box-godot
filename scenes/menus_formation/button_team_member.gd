extends Button

var slot: int
var party_member: PartyMember
var bench_member_buttons_container: VBoxContainer
var action_menu: VBoxContainer

func is_empty_slot():
	return !party_member

func clear_buttons():
	for child in bench_member_buttons_container.get_children():
		bench_member_buttons_container.remove_child(child)

func fill_buttons_switch():
	var i = 0
	
	for pm in PlayerParty.team:
		if(party_member != pm):
			var switch_member_button = preload("res://scenes/menus_formation/button_switch_member.tscn").instantiate()
			
			switch_member_button.text = pm.name
			switch_member_button.team_slot = slot
			switch_member_button.slot = i
			switch_member_button.action_menu = action_menu
			
			bench_member_buttons_container.add_child(switch_member_button)
		
		i = i + 1

func fill_buttons_bench():
	var i = 0
	
	for pm in PlayerParty.bench:
		var bench_member_button = preload("res://scenes/menus_formation/button_bench_member.tscn").instantiate()
		
		bench_member_button.text = pm.name
		bench_member_button.team_slot = slot
		bench_member_button.slot = i
		bench_member_button.action_menu = action_menu
		
		bench_member_buttons_container.add_child(bench_member_button)
		
		i = i + 1

func _on_pressed() -> void:
	get_tree().root.get_node("MenuFormation").select_team_slot(slot)
	
	clear_buttons()
	
	if(!is_empty_slot()):
		fill_buttons_switch()
	
	fill_buttons_bench()
	action_menu.show()
