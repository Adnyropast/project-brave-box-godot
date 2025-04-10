extends Node

class_name BattleCosts

static func expend_mp(pawn: PawnComponents, amount: int):
	pawn.variables.mp = pawn.variables.mp - amount
	
	if pawn.variables.mp < 0:
		pawn.variables.mp = 0
	
	if pawn.player_panel:
		pawn.player_panel.set_current_mp(pawn.variables.mp)
