extends Node

class_name BattleEffects

static func create_magic_cast(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/magic_cast.tscn").instantiate()
	
	pawn.node.add_child(effect_node)

static func create_impact_healing(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impact_healing.tscn").instantiate()
	
	pawn.node.add_child(effect_node)
