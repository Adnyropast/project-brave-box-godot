extends Node

class_name EffectMPHealing

static func heal_mp_amount(pawn: PawnComponents, amount: int):
	pawn.variables.mp = pawn.variables.mp + amount
	
	if pawn.variables.mp > pawn.variables.get_max_mp():
		pawn.variables.mp = pawn.variables.get_max_mp()
	
	BattlePopups.create_mp_healing_popup(pawn, amount)
	BattleEffects.create_impact_healing(pawn)
	
	if pawn.player_panel:
		pawn.player_panel.set_current_mp(pawn.variables.mp)
