extends Node

class_name PawnStates

var states: Array[PassiveScript] = []

func add_state(state: PassiveScript) -> void:
	states.append(state)
	state.on_attach()

func remove_state(state: PassiveScript) -> void:
	states.erase(state)

func clear_states() -> void:
	for state in states:
		state.on_detach()
	
	states.clear()

func on_turn_end() -> void:
	for state in states:
		state.on_turn_end()

func on_hurt(damage_data: DamageData) -> void:
	for state in states:
		state.on_hurt(damage_data)

func get_max_hp_multiplier() -> float:
	var multiplier = 1
	
	for state in states:
		multiplier = multiplier * state.get_max_hp_multiplier()
	
	return multiplier

func get_max_mp_multiplier() -> float:
	var multiplier = 1
	
	for state in states:
		multiplier = multiplier * state.get_max_mp_multiplier()
	
	return multiplier

func get_p_atk_multiplier() -> float:
	var multiplier = 1
	
	for state in states:
		multiplier = multiplier * state.get_p_atk_multiplier()
	
	return multiplier

func get_p_def_multiplier() -> float:
	var multiplier = 1
	
	for state in states:
		multiplier = multiplier * state.get_p_def_multiplier()
	
	return multiplier

func get_m_atk_multiplier() -> float:
	var multiplier = 1
	
	for state in states:
		multiplier = multiplier * state.get_m_atk_multiplier()
	
	return multiplier

func get_m_def_multiplier() -> float:
	var multiplier = 1
	
	for state in states:
		multiplier = multiplier * state.get_m_def_multiplier()
	
	return multiplier

func get_spd_multiplier() -> float:
	var multiplier = 1
	
	for state in states:
		multiplier = multiplier * state.get_spd_multiplier()
	
	return multiplier

func get_aim_multiplier() -> float:
	var multiplier = 1
	
	for state in states:
		multiplier = multiplier * state.get_aim_multiplier()
	
	return multiplier

func get_eva_multiplier() -> float:
	var multiplier = 1
	
	for state in states:
		multiplier = multiplier * state.get_eva_multiplier()
	
	return multiplier

func get_crit_multiplier() -> float:
	var multiplier = 1
	
	for state in states:
		multiplier = multiplier * state.get_crit_multiplier()
	
	return multiplier

func get_res_pwr_multiplier() -> float:
	var multiplier = 1
	
	for state in states:
		multiplier = multiplier * state.get_res_pwr_multiplier()
	
	return multiplier

func disable_ability(active_script: ActiveScript) -> String:
	for state in states:
		var message = state.disable_ability(active_script)
		
		if message:
			return message
	
	return ""

func block_turn() -> ActiveScript:
	for state in states:
		var active_script = state.block_turn()
		
		if active_script:
			return active_script
	
	return null
