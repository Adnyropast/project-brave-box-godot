extends Node

class_name Abilities

static func get_abilities_sets() -> Array[AbilitySet]:
	return [
		preload("res://resources/ability_sets/tabs_abilities/set_magic.tres"),
		preload("res://resources/ability_sets/tabs_abilities/set_healing.tres"),
		preload("res://resources/ability_sets/tabs_abilities/set_buffs.tres"),
		preload("res://resources/ability_sets/tabs_abilities/set_debuffs.tres"),
		preload("res://resources/ability_sets/tabs_abilities/set_ailments.tres"),
	]

static func get_debug_abilities_sets() -> Array[AbilitySet]:
	return [
		preload("res://resources/ability_sets/tabs_abilities/set_magic.tres"),
		preload("res://resources/ability_sets/tabs_abilities/set_healing.tres"),
		preload("res://resources/ability_sets/tabs_abilities/set_buffs.tres"),
		preload("res://resources/ability_sets/tabs_abilities/set_debuffs.tres"),
		preload("res://resources/ability_sets/tabs_abilities/set_ailments.tres"),
		preload("res://resources/ability_sets/tabs_abilities/set_misc.tres"),
	]
