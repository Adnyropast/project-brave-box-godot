extends Node

class_name PartyMemberExp

static func get_exp_diff_for_level(level: int) -> int:
	if level <= 1:
		return 0
	
	elif (level - 2) % 4 == 0:
		return 72
	
	elif (level - 2) % 4 == 1:
		return 144
	
	elif (level - 2) % 4 == 2:
		return 288
	
	elif (level - 2) % 4 == 3:
		return 576
	
	return 0

static func get_exp_required_for_level(level: int) -> int:
	var exp_required: int = 0
	
	for i in range(2, level + 1):
		exp_required = exp_required + get_exp_diff_for_level(i)
	
	return exp_required

static func get_exp_cumul_for_level(level: int) -> int:
	var exp_cumul: int = 0
	
	for i in range(2, level + 1):
		exp_cumul = exp_cumul + get_exp_required_for_level(i)
	
	return exp_cumul

static func calc_level_from_exp_cumul(exp_cumul: int) -> int:
	var level: int = 1
	
	while level < 99 and exp_cumul > get_exp_cumul_for_level(level + 1):
		level = level + 1
	
	return level

static func calc_current_exp_from_exp_cumul(exp_cumul: int) -> int:
	return exp_cumul - get_exp_cumul_for_level(calc_level_from_exp_cumul(exp_cumul))
