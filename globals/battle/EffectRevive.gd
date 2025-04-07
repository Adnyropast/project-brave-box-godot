extends Node

class_name EffectRevive

static func revive_amount(pawn: PawnComponents, amount: int):
	if pawn.variables.is_ko():
		EffectHealing.heal_amount(pawn, amount)
