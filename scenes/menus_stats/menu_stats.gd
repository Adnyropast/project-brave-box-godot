extends Control

var menu_pause: Control

func _ready() -> void:
	fill_buttons()
	update_stats(PlayerParty.team[0])

func _on_button_close_pressed() -> void:
	Menus.close_menu(self)
	Menus.open_menu(menu_pause)

func fill_buttons():
	for party_member in PlayerParty.get_all_members():
		var button = preload("res://scenes/menus_stats/button_member_stats.tscn").instantiate()
		
		button.text = party_member.party_member.name
		button.menu_stats = self
		button.party_member = party_member
		
		$MarginContainer/VBoxContainer/VBoxContainer.add_child(button)

func update_stats(party_member: PartyMemberVariables):
	update_level(party_member.get_level())
	update_current_exp(party_member.get_current_exp())
	update_next_exp(party_member.get_exp_for_next_level())
	update_exp_bar(party_member.get_current_exp(), party_member.get_exp_for_next_level())
	$MarginContainer2/StatsPanel.update_stats_from_party_member(party_member)

func update_level(value: int):
	$MarginContainer3/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/Label2.text = str(value)

func update_current_exp(value: int):
	$MarginContainer3/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer2/Label2.text = str(value)

func update_next_exp(value: int):
	$MarginContainer3/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer2/Label4.text = str(value)

func update_exp_bar(current_exp: int, next_exp: int):
	$MarginContainer3/PanelContainer/MarginContainer/VBoxContainer/ProgressBar.max_value = next_exp
	$MarginContainer3/PanelContainer/MarginContainer/VBoxContainer/ProgressBar.value = current_exp
