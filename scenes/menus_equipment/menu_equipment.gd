extends Control

enum EquipmentSlot {WEAPON, HEADGEAR, BODY_ARMOR, ACCESSORY}

var menu_pause: Control
var selected_party_member: PartyMemberVariables
var selected_equipment_slot: EquipmentSlot = EquipmentSlot.WEAPON

func _ready() -> void:
	fill_characters()
	fill_equipment_options()

func _on_button_close_pressed() -> void:
	Menus.close_menu(self)
	Menus.open_menu(menu_pause)

func _on_button_weapon_pressed() -> void:
	set_selected_equipment_slot(EquipmentSlot.WEAPON)

func _on_button_headgear_pressed() -> void:
	set_selected_equipment_slot(EquipmentSlot.HEADGEAR)

func _on_button_body_armor_pressed() -> void:
	set_selected_equipment_slot(EquipmentSlot.BODY_ARMOR)

func _on_button_accessory_pressed() -> void:
	set_selected_equipment_slot(EquipmentSlot.ACCESSORY)

func _on_button_remove_pressed() -> void:
	if selected_equipment_slot == EquipmentSlot.WEAPON:
		PartyMemberEquipment.equip_weapon(selected_party_member, null)
	elif selected_equipment_slot == EquipmentSlot.HEADGEAR:
		PartyMemberEquipment.equip_headgear(selected_party_member, null)
	elif selected_equipment_slot == EquipmentSlot.BODY_ARMOR:
		PartyMemberEquipment.equip_body_armor(selected_party_member, null)
	elif selected_equipment_slot == EquipmentSlot.ACCESSORY:
		PartyMemberEquipment.equip_accessory(selected_party_member, null)
	
	fill_equipment_slots()
	update_character_stats()
	fill_equipment_options()

static func get_item_name(item: Item) -> String:
	if item:
		return item.name
	
	return "---"

func fill_characters() -> void:
	var container = $MarginContainer/VBoxContainer/VBoxContainer
	
	for child in container.get_children():
		container.remove_child(child)
	
	for party_member in PlayerParty.get_all_members():
		var button = preload("res://scenes/menus_equipment/button_equipment_character.tscn").instantiate()
		
		button.text = party_member.party_member.name
		button.menu_equipment = self
		button.party_member = party_member
		
		container.add_child(button)
	
	set_selected_party_member(PlayerParty.team[0])

func set_selected_party_member(party_member: PartyMemberVariables) -> void:
	selected_party_member = party_member
	
	fill_equipment_slots()
	update_character_stats()

func fill_equipment_slots() -> void:
	$MarginContainer2/VBoxContainer/Label.text = selected_party_member.party_member.name
	$MarginContainer2/VBoxContainer/HBoxContainer/ButtonWeapon.text = get_item_name(selected_party_member.weapon)
	$MarginContainer2/VBoxContainer/HBoxContainer2/ButtonHeadgear.text = get_item_name(selected_party_member.headgear)
	$MarginContainer2/VBoxContainer/HBoxContainer3/ButtonBodyArmor.text = get_item_name(selected_party_member.body_armor)
	$MarginContainer2/VBoxContainer/HBoxContainer4/ButtonAccessory.text = get_item_name(selected_party_member.accessory)

func set_selected_equipment_slot(slot: EquipmentSlot) -> void:
	selected_equipment_slot = slot
	
	fill_equipment_options()

func fill_equipment_options() -> void:
	var container = $MarginContainer3/ScrollContainer/VBoxContainer/VBoxContainer
	
	for child in container.get_children():
		container.remove_child(child)
	
	var list: Array[ItemVariables]
	
	if selected_equipment_slot == EquipmentSlot.WEAPON:
		list = PlayerInventory.weapons
	elif selected_equipment_slot == EquipmentSlot.HEADGEAR:
		list = PlayerInventory.headgear
	elif selected_equipment_slot == EquipmentSlot.BODY_ARMOR:
		list = PlayerInventory.body_armor
	elif selected_equipment_slot == EquipmentSlot.ACCESSORY:
		list = PlayerInventory.accessories
	
	for iv in list:
		var button = preload("res://scenes/menus_equipment/button_equipment_item.tscn").instantiate()
		
		button.menu_equipment = self
		button.set_item_variables(iv)
		
		container.add_child(button)

func equip_item(item_variables: ItemVariables) -> void:
	if selected_equipment_slot == EquipmentSlot.WEAPON:
		PartyMemberEquipment.equip_weapon(selected_party_member, item_variables.item)
	elif selected_equipment_slot == EquipmentSlot.HEADGEAR:
		PartyMemberEquipment.equip_headgear(selected_party_member, item_variables.item)
	elif selected_equipment_slot == EquipmentSlot.BODY_ARMOR:
		PartyMemberEquipment.equip_body_armor(selected_party_member, item_variables.item)
	elif selected_equipment_slot == EquipmentSlot.ACCESSORY:
		PartyMemberEquipment.equip_accessory(selected_party_member, item_variables.item)
	
	fill_equipment_slots()
	update_character_stats()
	fill_equipment_options()

func update_character_stats() -> void:
	$MarginContainer4/StatsPanel.update_stats_from_party_member(selected_party_member)
