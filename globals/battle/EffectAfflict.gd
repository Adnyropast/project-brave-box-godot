extends Node

class_name EffectAfflict

static func afflict(pawn: PawnComponents, passive_ability: PassiveAbility) -> void:
	var passive_script: PassiveScript = passive_ability.gdscript.new()
	
	passive_script.ability = passive_ability
	passive_script.user = pawn
	
	pawn.variables.states.add_state(passive_script)

static func afflict_buff(pawn: PawnComponents, passive_ability: PassiveAbility) -> void:
	afflict(pawn, passive_ability)
	BattleEffects.create_impact_buff(pawn)

static func afflict_debuff(pawn: PawnComponents, passive_ability: PassiveAbility) -> void:
	afflict(pawn, passive_ability)
	BattleEffects.create_impact_debuff(pawn)
