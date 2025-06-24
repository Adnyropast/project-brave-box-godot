extends Node

class_name EffectDefend

static func defend(pawn: PawnComponents) -> void:
	pawn.variables.state_defend = true
	pawn.node.return_to_default()
	BattleEffects.create_defending_effect(pawn)
