extends Node

class_name PartyMemberEquipmentStats

static func get_max_hp(party_member: PartyMemberVariables) -> int:
	var value = 0
	
	if party_member.weapon:
		value = value + party_member.weapon.max_hp
	
	if party_member.headgear:
		value = value + party_member.headgear.max_hp
	
	if party_member.body_armor:
		value = value + party_member.body_armor.max_hp
	
	if party_member.accessory:
		value = value + party_member.accessory.max_hp
	
	return value

static func get_max_mp(party_member: PartyMemberVariables) -> int:
	var value = 0
	
	if party_member.weapon:
		value = value + party_member.weapon.max_mp
	
	if party_member.headgear:
		value = value + party_member.headgear.max_mp
	
	if party_member.body_armor:
		value = value + party_member.body_armor.max_mp
	
	if party_member.accessory:
		value = value + party_member.accessory.max_mp
	
	return value

static func get_p_atk(party_member: PartyMemberVariables) -> int:
	var value = 0
	
	if party_member.weapon:
		value = value + party_member.weapon.p_atk
	
	if party_member.headgear:
		value = value + party_member.headgear.p_atk
	
	if party_member.body_armor:
		value = value + party_member.body_armor.p_atk
	
	if party_member.accessory:
		value = value + party_member.accessory.p_atk
	
	return value

static func get_p_def(party_member: PartyMemberVariables) -> int:
	var value = 0
	
	if party_member.weapon:
		value = value + party_member.weapon.p_def
	
	if party_member.headgear:
		value = value + party_member.headgear.p_def
	
	if party_member.body_armor:
		value = value + party_member.body_armor.p_def
	
	if party_member.accessory:
		value = value + party_member.accessory.p_def
	
	return value

static func get_m_atk(party_member: PartyMemberVariables) -> int:
	var value = 0
	
	if party_member.weapon:
		value = value + party_member.weapon.m_atk
	
	if party_member.headgear:
		value = value + party_member.headgear.m_atk
	
	if party_member.body_armor:
		value = value + party_member.body_armor.m_atk
	
	if party_member.accessory:
		value = value + party_member.accessory.m_atk
	
	return value

static func get_m_def(party_member: PartyMemberVariables) -> int:
	var value = 0
	
	if party_member.weapon:
		value = value + party_member.weapon.m_def
	
	if party_member.headgear:
		value = value + party_member.headgear.m_def
	
	if party_member.body_armor:
		value = value + party_member.body_armor.m_def
	
	if party_member.accessory:
		value = value + party_member.accessory.m_def
	
	return value

static func get_spd(party_member: PartyMemberVariables) -> int:
	var value = 0
	
	if party_member.weapon:
		value = value + party_member.weapon.spd
	
	if party_member.headgear:
		value = value + party_member.headgear.spd
	
	if party_member.body_armor:
		value = value + party_member.body_armor.spd
	
	if party_member.accessory:
		value = value + party_member.accessory.spd
	
	return value

static func get_aim(party_member: PartyMemberVariables) -> int:
	var value = 0
	
	if party_member.weapon:
		value = value + party_member.weapon.aim
	
	if party_member.headgear:
		value = value + party_member.headgear.aim
	
	if party_member.body_armor:
		value = value + party_member.body_armor.aim
	
	if party_member.accessory:
		value = value + party_member.accessory.aim
	
	return value

static func get_eva(party_member: PartyMemberVariables) -> int:
	var value = 0
	
	if party_member.weapon:
		value = value + party_member.weapon.eva
	
	if party_member.headgear:
		value = value + party_member.headgear.eva
	
	if party_member.body_armor:
		value = value + party_member.body_armor.eva
	
	if party_member.accessory:
		value = value + party_member.accessory.eva
	
	return value

static func get_crit(party_member: PartyMemberVariables) -> int:
	var value = 0
	
	if party_member.weapon:
		value = value + party_member.weapon.crit
	
	if party_member.headgear:
		value = value + party_member.headgear.crit
	
	if party_member.body_armor:
		value = value + party_member.body_armor.crit
	
	if party_member.accessory:
		value = value + party_member.accessory.crit
	
	return value

static func get_res_pwr(party_member: PartyMemberVariables) -> int:
	var value = 0
	
	if party_member.weapon:
		value = value + party_member.weapon.res_pwr
	
	if party_member.headgear:
		value = value + party_member.headgear.res_pwr
	
	if party_member.body_armor:
		value = value + party_member.body_armor.res_pwr
	
	if party_member.accessory:
		value = value + party_member.accessory.res_pwr
	
	return value
