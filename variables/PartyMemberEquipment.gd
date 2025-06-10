extends Node

class_name PartyMemberEquipment

static func equip_weapon(party_member: PartyMemberVariables, weapon: Weapon) -> void:
	if party_member.weapon:
		PlayerInventory.add_item(party_member.weapon, 1)
	
	party_member.weapon = weapon
	
	if weapon:
		PlayerInventory.expend_item(weapon)

static func equip_headgear(party_member: PartyMemberVariables, headgear: Headgear) -> void:
	if party_member.headgear:
		PlayerInventory.add_item(party_member.headgear, 1)
	
	party_member.headgear = headgear
	
	if headgear:
		PlayerInventory.expend_item(headgear)

static func equip_body_armor(party_member: PartyMemberVariables, body_armor: BodyArmor) -> void:
	if party_member.body_armor:
		PlayerInventory.add_item(party_member.body_armor, 1)
	
	party_member.body_armor = body_armor
	
	if body_armor:
		PlayerInventory.expend_item(body_armor)

static func equip_accessory(party_member: PartyMemberVariables, accessory: Accessory) -> void:
	if party_member.accessory:
		PlayerInventory.add_item(party_member.accessory, 1)
	
	party_member.accessory = accessory
	
	if accessory:
		PlayerInventory.expend_item(accessory)
