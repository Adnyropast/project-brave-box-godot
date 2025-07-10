extends Control

var menu_pause: Control
var selected_party_member: PartyMemberVariables
var selected_ability_slot: int

func _init() -> void:
	FocusButtons.set_focus_on_draw(self)

func _ready() -> void:
	fill_characters()
	fill_abilities_tabs()

func _on_button_close_pressed() -> void:
	Menus.close_menu(self)
	Menus.open_menu(menu_pause)

func _on_button_remove_pressed() -> void:
	selected_party_member.equip_ability(selected_ability_slot, null)
	
	fill_ability_slots()
	update_character_stats()

func _on_button_cancel_pressed() -> void:
	fill_abilities_tabs()
	FocusButtons.focus_first_child($MarginContainer3)

static func get_ability_name(ability: ActiveAbility) -> String:
	if ability:
		return ability.name
	
	return "---"

func fill_characters() -> void:
	var container = $MarginContainer/VBoxContainer/VBoxContainerCharacters
	
	for child in container.get_children():
		container.remove_child(child)
	
	for party_member in PlayerParty.get_all_members():
		var button = preload("res://scenes/menus_abilities/button_abilities_character.tscn").instantiate()
		
		button.text = party_member.party_member.name
		button.menu_abilities = self
		button.party_member = party_member
		
		container.add_child(button)
	
	set_selected_party_member(PlayerParty.team[0])

func set_selected_party_member(party_member: PartyMemberVariables) -> void:
	selected_party_member = party_member
	
	fill_ability_slots()
	update_character_stats()

func fill_ability_slots() -> void:
	$MarginContainer2/VBoxContainer/LabelCharacterName.text = selected_party_member.party_member.name
	
	var container = $MarginContainer2/VBoxContainer/VBoxContainerAbilities
	
	for child in container.get_children():
		container.remove_child(child)
	
	var slot_index = 0
	
	for ability in selected_party_member.abilities:
		var button = preload("res://scenes/menus_abilities/button_ability_slot.tscn").instantiate()
		
		button.text = get_ability_name(ability)
		button.menu_abilities = self
		button.slot_index = slot_index
		
		container.add_child(button)
		
		slot_index = slot_index + 1

func set_selected_ability_slot(slot: int) -> void:
	selected_ability_slot = slot
	
	fill_abilities_tabs()

func fill_abilities_tabs() -> void:
	var container = $MarginContainer3/ScrollContainer/VBoxContainer/VBoxContainerOptions
	
	for child in container.get_children():
		container.remove_child(child)
	
	for ability_set in Abilities.get_abilities_sets():
		var button = preload("res://scenes/menus_abilities/button_ability_option_tab.tscn").instantiate()
		
		button.text = ability_set.name
		button.menu_abilities = self
		button.ability_set = ability_set
		
		container.add_child(button)
	
	$MarginContainer3/ScrollContainer/VBoxContainer/ButtonRemove.show()
	$MarginContainer3/ScrollContainer/VBoxContainer/ButtonCancel.hide()

func fill_abilities_options(ability_set: AbilitySet) -> void:
	var container = $MarginContainer3/ScrollContainer/VBoxContainer/VBoxContainerOptions
	
	for child in container.get_children():
		container.remove_child(child)
	
	for ability in ability_set.abilities:
		var button = preload("res://scenes/menus_abilities/button_ability_option_item.tscn").instantiate()
		
		button.text = ability.name
		button.menu_abilities = self
		button.ability = ability
		
		container.add_child(button)
	
	$MarginContainer3/ScrollContainer/VBoxContainer/ButtonRemove.hide()
	$MarginContainer3/ScrollContainer/VBoxContainer/ButtonCancel.show()
	
	FocusButtons.focus_first_child($MarginContainer3)

func equip_ability(ability: ActiveAbility) -> void:
	selected_party_member.equip_ability(selected_ability_slot, ability)
	
	fill_ability_slots()
	update_character_stats()

func update_character_stats() -> void:
	$MarginContainer4/StatsPanel.update_stats_from_party_member(selected_party_member)
