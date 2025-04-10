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
		
		button.text = party_member.name
		button.menu_stats = self
		button.party_member = party_member
		
		$MarginContainer/VBoxContainer/VBoxContainer.add_child(button)

func update_stats(party_member: PartyMember):
	update_maximum_hp(party_member.multiply_max_hp(3000))
	update_maximum_mp(party_member.multiply_max_mp(300))
	update_physical_attack(party_member.multiply_p_atk(100))
	update_physical_defense(party_member.multiply_p_def(100))
	update_magical_attack(party_member.multiply_m_atk(100))
	update_magical_defense(party_member.multiply_m_def(100))
	update_speed(party_member.multiply_spd(100))
	update_aim(party_member.multiply_aim(100))
	update_evasion(party_member.multiply_eva(100))
	update_critical_chance(party_member.multiply_crit(100))
	update_restorative_power(party_member.multiply_res_pwr(100))

func update_maximum_hp(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/PanelContainer2/Label.text = str(value)

func update_maximum_mp(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer2/PanelContainer2/Label.text = str(value)

func update_physical_attack(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer3/PanelContainer2/Label.text = str(value)

func update_physical_defense(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer4/PanelContainer2/Label.text = str(value)

func update_magical_attack(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer5/PanelContainer2/Label.text = str(value)

func update_magical_defense(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer6/PanelContainer2/Label.text = str(value)

func update_speed(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer7/PanelContainer2/Label.text = str(value)

func update_aim(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer8/PanelContainer2/Label.text = str(value)

func update_evasion(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer9/PanelContainer2/Label.text = str(value)

func update_critical_chance(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer10/PanelContainer2/Label.text = str(value)

func update_restorative_power(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer11/PanelContainer2/Label.text = str(value)
