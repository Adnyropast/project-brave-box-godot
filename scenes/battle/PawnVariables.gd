extends Node

class_name PawnVariables

var party_member: PartyMemberVariables
var enemy: Enemy
var states: PawnStates
var name_alias: String
var ap: float
var hp: int
var mp: int
var state_defend: bool
var level: int

func _init() -> void:
	states = PawnStates.new()

func init_from_party_member(_party_member: PartyMemberVariables):
	party_member = _party_member
	name_alias = party_member.party_member.name
	level = party_member.get_level()
	hp = party_member.current_hp
	mp = party_member.current_mp

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
	var value = 0
	
	if party_member:
		value = party_member.get_max_hp()
	elif enemy:
		value = EnemyStats.get_max_hp(get_level())
	
	value = value * states.get_max_hp_multiplier()
	
	return value

func get_max_mp() -> int:
	var value = 0
	
	if party_member:
		value = party_member.get_max_mp()
	elif enemy:
		value = EnemyStats.get_max_mp(get_level())
	
	value = value * states.get_max_mp_multiplier()
	
	return value

func get_p_atk() -> int:
	var value = 0
	
	if party_member:
		value = party_member.get_p_atk()
	elif enemy:
		value = EnemyStats.get_p_atk(get_level())
	
	value = value * states.get_p_atk_multiplier()
	
	return value

func get_p_def() -> int:
	var value = 0
	
	if party_member:
		value = party_member.get_p_def()
	elif enemy:
		value = EnemyStats.get_p_def(get_level())
	
	value = value * states.get_p_def_multiplier()
	
	return value

func get_m_atk() -> int:
	var value = 0
	
	if party_member:
		value = party_member.get_m_atk()
	elif enemy:
		value = EnemyStats.get_m_atk(get_level())
	
	value = value * states.get_m_atk_multiplier()
	
	return value

func get_m_def() -> int:
	var value = 0
	
	if party_member:
		value = party_member.get_m_def()
	elif enemy:
		value = EnemyStats.get_m_def(get_level())
	
	value = value * states.get_m_def_multiplier()
	
	return value

func get_speed() -> int:
	var value = 0
	
	if party_member:
		value = party_member.get_spd()
	elif enemy:
		value = EnemyStats.get_spd(get_level())
	
	value = value * states.get_spd_multiplier()
	
	return value

func get_aim() -> int:
	var value = 0
	
	if party_member:
		value = party_member.get_aim()
	elif enemy:
		value = EnemyStats.get_aim(get_level())
	
	value = value * states.get_aim_multiplier()
	
	return value

func get_eva() -> int:
	var value = 0
	
	if party_member:
		value = party_member.get_eva()
	elif enemy:
		value = EnemyStats.get_eva(get_level())
	
	value = value * states.get_eva_multiplier()
	
	return value

func get_crit() -> int:
	var value = 0
	
	if party_member:
		value = party_member.get_crit()
	elif enemy:
		value = EnemyStats.get_crit(get_level())
	
	value = value * states.get_crit_multiplier()
	
	return value

func get_res_pwr() -> int:
	var value = 0
	
	if party_member:
		value = party_member.get_res_pwr()
	elif enemy:
		value = EnemyStats.get_res_pwr(get_level())
	
	value = value * states.get_res_pwr_multiplier()
	
	return value

func is_ko() -> bool:
	return hp <= 0

func on_turn_start():
	state_defend = false

func on_turn_end():
	states.on_turn_end()

func on_hurt(damage_data: DamageData) -> void:
	states.on_hurt(damage_data)

func on_ko():
	state_defend = false
	states.clear_states()

func multiply_damage(damage: int) -> int:
	if state_defend:
		return floori(damage / 2.0)
	
	return damage

func get_damage_type_multiplier(type: Types.Damage) -> float:
	if enemy:
		return enemy.get_type_multiplier(type)
	
	return 1

func get_weapon_type() -> Types.Damage:
	if party_member:
		return party_member.get_weapon_type()
	
	return Types.Damage.PHYSICAL

func disable_ability(active_script: ActiveScript) -> String:
	return states.disable_ability(active_script)

func block_turn() -> ActiveScript:
	return states.block_turn()

func get_active_abilities() -> Array[ActiveAbility]:
	var abilities: Array[ActiveAbility] = []
	
	if party_member:
		return party_member.get_active_abilities()
	elif enemy:
		return enemy.ability_set.get_active_abilities()
	
	return abilities

func get_active_abilities_all() -> Array[ActiveAbility]:
	var abilities: Array[ActiveAbility] = [
		preload("res://resources/active_abilities/attack.tres"),
		preload("res://resources/active_abilities/defend.tres"),
	]
	
	abilities.append_array(get_active_abilities())
	
	return abilities

func get_active_abilities_attacking() -> Array[ActiveAbility]:
	var abilities: Array[ActiveAbility] = [
		preload("res://resources/active_abilities/attack.tres"),
	]
	
	return abilities
