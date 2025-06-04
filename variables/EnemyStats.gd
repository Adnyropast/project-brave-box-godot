extends Node

class_name EnemyStats

static func get_max_hp(level: int) -> int:
	return 300 + level * 72

static func get_max_mp(level: int) -> int:
	return 200 + level * 6

static func get_p_atk(level: int) -> int:
	return 20 + level * 2

static func get_p_def(level: int) -> int:
	return 0 + level * 2

static func get_m_atk(level: int) -> int:
	return 20 + level * 2

static func get_m_def(level: int) -> int:
	return 0 + level * 2

static func get_spd(level: int) -> int:
	return 20 + level * 2

static func get_aim(level: int) -> int:
	return 100 + level * 2

static func get_eva(level: int) -> int:
	return 10 + level * 2

static func get_crit(level: int) -> int:
	return roundi(1 + level * 0.25)

static func get_res_pwr(level: int) -> int:
	return 20 + level * 2
