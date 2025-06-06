extends Node

class_name BattleCalcs

static func get_base_damage_physical(attacker: PawnComponents, target: PawnComponents) -> int:
	var damage = 4 * (attacker.variables.get_p_atk() - target.variables.get_p_def())
	
	if damage < 0:
		damage = 0
	
	return damage

static func get_base_damage_magical(attacker: PawnComponents, target: PawnComponents) -> int:
	var damage = 4 * (attacker.variables.get_m_atk() - target.variables.get_m_def())
	
	if damage < 0:
		damage = 0
	
	return damage

static func get_base_healing(user: PawnComponents) -> int:
	return 4 * user.variables.get_res_pwr()
