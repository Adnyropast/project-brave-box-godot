extends Node

class_name EffectHealing

static func heal_amount(pawn: PawnComponents, amount: int):
	pawn.variables.hp = pawn.variables.hp + amount
	
	if pawn.variables.hp > pawn.variables.get_max_hp():
		pawn.variables.hp = pawn.variables.get_max_hp()
	
	BattlePopups.create_healing_popup(pawn, amount)
	BattleEffects.create_impact_healing(pawn)
	pawn.node.return_to_default_not_busy()
	
	if pawn.player_panel:
		pawn.player_panel.set_current_hp(pawn.variables.hp)
