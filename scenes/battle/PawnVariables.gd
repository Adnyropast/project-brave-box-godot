extends Node

class_name PawnVariables

var party_member: PartyMemberVariables
var enemy: Enemy
var name_alias: String
var ap: float
var hp: int
var mp: int
var state_defend: bool
var level: int

func init_from_party_member(_party_member: PartyMemberVariables):
	party_member = _party_member
	name_alias = party_member.party_member.name
	level = party_member.get_level()
	hp = get_max_hp()
	mp = get_max_mp()

func init_from_enemy(_enemy: Enemy, alias: String, _level: int):
	enemy = _enemy
	name_alias = alias
	level = _level
	hp = get_max_hp()
	mp = get_max_mp()

func get_level() -> int:
	if party_member:
		return party_member.get_level()
	
	return level

func get_max_hp() -> int:
	if party_member:
		return party_member.get_max_hp()
	elif enemy:
		return EnemyStats.get_max_hp(get_level())
	
	return 0

func get_max_mp() -> int:
	if party_member:
		return party_member.get_max_mp()
	elif enemy:
		return EnemyStats.get_max_mp(get_level())
	
	return 0

func get_p_atk() -> int:
	if party_member:
		return party_member.get_p_atk()
	elif enemy:
		return EnemyStats.get_p_atk(get_level())
	
	return 0

func get_p_def() -> int:
	if party_member:
		return party_member.get_p_def()
	elif enemy:
		return EnemyStats.get_p_def(get_level())
	
	return 0

func get_m_atk() -> int:
	if party_member:
		return party_member.get_m_atk()
	elif enemy:
		return EnemyStats.get_m_atk(get_level())
	
	return 0

func get_m_def() -> int:
	if party_member:
		return party_member.get_m_def()
	elif enemy:
		return EnemyStats.get_m_def(get_level())
	
	return 0

func get_speed() -> int:
	if party_member:
		return party_member.get_spd()
	elif enemy:
		return EnemyStats.get_spd(get_level())
	
	return 0

func get_aim() -> int:
	if party_member:
		return party_member.get_aim()
	elif enemy:
		return EnemyStats.get_aim(get_level())
	
	return 0

func get_eva() -> int:
	if party_member:
		return party_member.get_eva()
	elif enemy:
		return EnemyStats.get_eva(get_level())
	
	return 0

func get_crit() -> int:
	if party_member:
		return party_member.get_crit()
	elif enemy:
		return EnemyStats.get_crit(get_level())
	
	return 0

func get_res_pwr() -> int:
	if party_member:
		return party_member.get_res_pwr()
	elif enemy:
		return EnemyStats.get_res_pwr(get_level())
	
	return 0

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
