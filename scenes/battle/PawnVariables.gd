extends Node

class_name PawnVariables

var party_member: PartyMember
var enemy: Enemy
var name_alias: String
var ap: float
var hp: int
var mp: int
var state_defend: bool

func init_from_party_member(_party_member: PartyMember):
	party_member = _party_member
	name_alias = party_member.name
	hp = get_max_hp()
	mp = get_max_mp()

func init_from_enemy(_enemy: Enemy):
	enemy = _enemy
	name_alias = enemy.name
	hp = get_max_hp()
	mp = get_max_mp()

func get_max_hp() -> int:
	if party_member:
		return party_member.multiply_max_hp(3000)
	
	return 3000

func get_max_mp() -> int:
	if party_member:
		return party_member.multiply_max_mp(300)
	
	return 300

func get_p_atk() -> int:
	if party_member:
		return party_member.multiply_p_atk(100)
	
	return 100

func get_p_def() -> int:
	if party_member:
		return party_member.multiply_p_def(50)
	
	return 0

func get_m_atk() -> int:
	if party_member:
		return party_member.multiply_m_atk(100)
	
	return 100

func get_m_def() -> int:
	if party_member:
		return party_member.multiply_m_def(50)
	
	return 0

func get_speed() -> int:
	if party_member:
		return party_member.multiply_spd(100)
	
	return 100

func get_aim() -> int:
	if party_member:
		return party_member.multiply_aim(170)
	
	return 170

func get_eva() -> int:
	if party_member:
		return party_member.multiply_eva(100)
	
	return 100

func get_crit() -> int:
	if party_member:
		return party_member.multiply_crit(100)
	
	return 100

func get_res_pwr() -> int:
	if party_member:
		return party_member.multiply_res_pwr(100)
	
	return 100

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
