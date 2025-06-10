extends Node

class_name PartyMemberVariables

var party_member: PartyMember
var level: int
var current_exp: int
var exp_required_next: int
var current_hp: int
var current_mp: int
var weapon: Weapon
var headgear: Headgear
var body_armor: BodyArmor
var accessory: Accessory

func _init(_party_member: PartyMember) -> void:
	party_member = _party_member
	level = 1
	current_exp = 0
	weapon = party_member.initial_weapon
	headgear = party_member.initial_headgear
	body_armor = party_member.initial_body_armor
	accessory = party_member.initial_accessory
	update_exp_required_next()
	current_hp = get_max_hp()
	current_mp = get_max_mp()

func get_level() -> int:
	return level

func get_current_exp() -> int:
	return current_exp

func get_exp_for_next_level() -> int:
	return exp_required_next

func add_exp(_plus_exp: int) -> void:
	current_exp = current_exp + _plus_exp
	exp_required_next = PartyMemberExp.get_exp_required_for_level(level + 1)
	
	while current_exp >= exp_required_next:
		current_exp = current_exp - exp_required_next
		level = level + 1
		exp_required_next = PartyMemberExp.get_exp_required_for_level(level + 1)

func update_exp_required_next() -> void:
	exp_required_next = PartyMemberExp.get_exp_required_for_level(get_level() + 1)

func get_max_hp() -> int:
	return party_member.multiply_max_hp(PartyMemberStats.get_max_hp(get_level()))

func get_max_mp() -> int:
	return party_member.multiply_max_mp(PartyMemberStats.get_max_mp(get_level()))

func get_p_atk() -> int:
	return party_member.multiply_p_atk(PartyMemberStats.get_p_atk(get_level()))

func get_p_def() -> int:
	return party_member.multiply_p_def(PartyMemberStats.get_p_def(get_level()))

func get_m_atk() -> int:
	return party_member.multiply_m_atk(PartyMemberStats.get_m_atk(get_level()))

func get_m_def() -> int:
	return party_member.multiply_m_def(PartyMemberStats.get_m_def(get_level()))

func get_spd() -> int:
	return party_member.multiply_spd(PartyMemberStats.get_spd(get_level()))

func get_aim() -> int:
	return party_member.multiply_aim(PartyMemberStats.get_aim(get_level()))

func get_eva() -> int:
	return party_member.multiply_eva(PartyMemberStats.get_eva(get_level()))

func get_crit() -> int:
	return party_member.multiply_crit(PartyMemberStats.get_crit(get_level()))

func get_res_pwr() -> int:
	return party_member.multiply_res_pwr(PartyMemberStats.get_res_pwr(get_level()))

func restore_hp() -> void:
	current_hp = get_max_hp()

func restore_mp() -> void:
	current_mp = get_max_mp()

func get_weapon_type() -> Types.Damage:
	if weapon:
		return weapon.damage_type
	
	return Types.Damage.PHYSICAL
