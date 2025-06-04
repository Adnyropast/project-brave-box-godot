extends Node

class_name PawnVariables

var party_member: PartyMemberVariables
var enemy: Enemy
var name_alias: String
var ap: float
var hp: int
var mp: int
var state_defend: bool

func init_from_party_member(_party_member: PartyMemberVariables):
	party_member = _party_member
	name_alias = party_member.party_member.name
	hp = get_max_hp()
	mp = get_max_mp()

func init_from_enemy(_enemy: Enemy, alias: String):
	enemy = _enemy
	name_alias = alias
	hp = get_max_hp()
	mp = get_max_mp()

func get_level() -> int:
	if party_member:
		return party_member.get_level()
	
	return 1

func get_max_hp() -> int:
	if party_member:
		return party_member.get_max_hp()
	
	return 300 + get_level() * 72

func get_max_mp() -> int:
	if party_member:
		return party_member.get_max_mp()
	
	return 200 + get_level() * 6

func get_p_atk() -> int:
	if party_member:
		return party_member.get_p_atk()
	
	return 20 + get_level() * 2

func get_p_def() -> int:
	if party_member:
		return party_member.get_p_def()
	
	return 0 + get_level() * 2

func get_m_atk() -> int:
	if party_member:
		return party_member.get_m_atk()
	
	return 20 + get_level() * 2

func get_m_def() -> int:
	if party_member:
		return party_member.get_m_def()
	
	return 0 + get_level() * 2

func get_speed() -> int:
	if party_member:
		return party_member.get_spd()
	
	return 20 + get_level() * 2

func get_aim() -> int:
	if party_member:
		return party_member.get_aim()
	
	return 100 + get_level() * 2

func get_eva() -> int:
	if party_member:
		return party_member.get_eva()
	
	return 10 + get_level() * 2

func get_crit() -> int:
	if party_member:
		return party_member.get_crit()
	
	return roundi(1 + get_level() * 0.25)

func get_res_pwr() -> int:
	if party_member:
		return party_member.get_res_pwr()
	
	return 20 + get_level() * 2

func is_ko() -> bool:
	return hp <= 0

func on_turn_start():
	state_defend = false

func on_ko():
	state_defend = false

func multiply_damage(damage: int) -> int:
	if state_defend:
		return damage / 2
	
	return damage
