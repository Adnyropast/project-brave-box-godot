extends Control

var team_member_buttons_container: VBoxContainer
var bench_member_buttons_container: VBoxContainer
var action_menu: VBoxContainer
var tree: SceneTree
var menu_pause: Control
var team_slot: int = -1

func clear_buttons():
	for child in team_member_buttons_container.get_children():
		team_member_buttons_container.remove_child(child)

func fill_buttons():
	var i = 0
	
	for party_member in PlayerParty.team:
		var team_member_button = preload("res://scenes/menus_formation/button_team_member.tscn").instantiate()
		
		team_member_button.text = party_member.name
		team_member_button.slot = i
		team_member_button.party_member = party_member
		team_member_button.bench_member_buttons_container = bench_member_buttons_container
		team_member_button.action_menu = action_menu
		
		team_member_buttons_container.add_child(team_member_button)
		
		i = i + 1
	
	while i < PlayerParty.TEAM_COUNT:
		var team_member_button = preload("res://scenes/menus_formation/button_team_member.tscn").instantiate()
		
		team_member_button.text = "-"
		team_member_button.slot = i
		team_member_button.party_member = null
		team_member_button.bench_member_buttons_container = bench_member_buttons_container
		team_member_button.action_menu = action_menu
		
		team_member_buttons_container.add_child(team_member_button)
		
		i = i + 1

func update_buttons():
	if(PlayerParty.team.size() > 1):
		$MarginContainer/HBoxContainer/VBoxContainer2/ButtonRemove.show()
	else:
		$MarginContainer/HBoxContainer/VBoxContainer2/ButtonRemove.hide()
	
	clear_buttons()
	fill_buttons()

func close_menu():
	tree.root.add_child(menu_pause)
	tree.root.remove_child(self)

func select_team_slot(_team_slot: int):
	team_slot = _team_slot

func bench_selected_member():
	PlayerParty.bench_team_member(team_slot)
	update_buttons()
	action_menu.hide()

func _ready() -> void:
	team_member_buttons_container = $MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer
	bench_member_buttons_container = $MarginContainer/HBoxContainer/VBoxContainer2/VBoxContainer
	action_menu = $MarginContainer/HBoxContainer/VBoxContainer2
	tree = get_tree()
	
	action_menu.hide()
	
	update_buttons()

func _on_button_close_pressed() -> void:
	close_menu()

func _on_button_cancel_pressed() -> void:
	action_menu.hide()
	team_slot = -1

func _on_button_remove_pressed() -> void:
	bench_selected_member()
