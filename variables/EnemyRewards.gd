extends Node

class_name EnemyRewards

static func get_money(level: int) -> int:
	return roundi(7 + ((level - 1) / (98.0)) * (190 - 7))

static func get_exp(level: int) -> int:
	return roundi(4 + ((level - 1) / (98.0)) * (260 - 4))
