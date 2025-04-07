extends Node

class_name BattleEffects

enum Type {TYPE_PHYSICAL, TYPE_FIRE, TYPE_WATER, TYPE_LIGHTNING, TYPE_EARTH, TYPE_WIND, TYPE_LIGHT, TYPE_DARK}

static func create_attack_swing(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/attack_swing.tscn").instantiate()
	
	pawn.node.add_child(effect_node)

static func create_magic_cast(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/magic_cast.tscn").instantiate()
	
	pawn.node.add_child(effect_node)

static func create_impact_physical(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impact_physical.tscn").instantiate()
	
	pawn.node.add_child(effect_node)

static func create_impact_fire(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impact_fire.tscn").instantiate()
	
	pawn.node.add_child(effect_node)

static func create_impact_water(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impact_water.tscn").instantiate()
	
	pawn.node.add_child(effect_node)

static func create_impact_lightning(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impact_lightning.tscn").instantiate()
	
	pawn.node.add_child(effect_node)

static func create_impact_earth(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impact_earth.tscn").instantiate()
	
	pawn.node.add_child(effect_node)

static func create_impact_wind(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impact_wind.tscn").instantiate()
	
	pawn.node.add_child(effect_node)

static func create_impact_light(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impact_light.tscn").instantiate()
	
	pawn.node.add_child(effect_node)

static func create_impact_dark(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impact_dark.tscn").instantiate()
	
	pawn.node.add_child(effect_node)

static func create_impact_healing(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impact_healing.tscn").instantiate()
	
	pawn.node.add_child(effect_node)

static func create_impact_typed(pawn: PawnComponents, type: Type):
	if type == Type.TYPE_PHYSICAL:
		create_impact_physical(pawn)
	elif type == Type.TYPE_FIRE:
		create_impact_fire(pawn)
	elif type == Type.TYPE_WATER:
		create_impact_water(pawn)
	elif type == Type.TYPE_LIGHTNING:
		create_impact_lightning(pawn)
	elif type == Type.TYPE_EARTH:
		create_impact_earth(pawn)
	elif type == Type.TYPE_WIND:
		create_impact_wind(pawn)
	elif type == Type.TYPE_LIGHT:
		create_impact_light(pawn)
	elif type == Type.TYPE_DARK:
		create_impact_dark(pawn)

static func create_vanish_effect(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/vanish.tscn").instantiate()
	
	pawn.node.add_child(effect_node)
