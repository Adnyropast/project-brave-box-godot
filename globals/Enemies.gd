extends Node

class_name Enemies

static func get_all_enemies() -> Array[Enemy]:
	return [
		preload("res://resources/enemies/goblin_archer.tres"),
		preload("res://resources/enemies/goblin_chopper.tres"),
		preload("res://resources/enemies/goblin_swordsman.tres"),
		preload("res://resources/enemies/orc_healer.tres"),
		preload("res://resources/enemies/strolhomer_shieldbearer.tres"),
		preload("res://resources/enemies/lilyrockan_scientist.tres"),
		preload("res://resources/enemies/mole_gunner.tres"),
		preload("res://resources/enemies/felid_mage.tres"),
		preload("res://resources/enemies/birdian_slicer.tres"),
		preload("res://resources/enemies/lizardman_lancer.tres"),
		preload("res://resources/enemies/bugman_archer.tres"),
		preload("res://resources/enemies/sylph_hex.tres"),
		preload("res://resources/enemies/remnant_swordsman.tres"),
		preload("res://resources/enemies/prismoid_healer.tres"),
		preload("res://resources/enemies/wraith_singer.tres"),
	]
