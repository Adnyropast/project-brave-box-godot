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

static func afflict_poison(pawn: PawnComponents) -> void:
	afflict(pawn, preload("res://resources/passive_abilities/ailments/ailment_poison.tres"))
	BattleEffects.create_impact_poison(pawn)

static func afflict_blindness(pawn: PawnComponents) -> void:
	afflict(pawn, preload("res://resources/passive_abilities/ailments/ailment_blindness.tres"))
	BattleEffects.create_impact_blindness(pawn)

static func afflict_silence(pawn: PawnComponents) -> void:
	afflict(pawn, preload("res://resources/passive_abilities/ailments/ailment_silence.tres"))
	BattleEffects.create_impact_silence(pawn)

static func afflict_sleep(pawn: PawnComponents) -> void:
	afflict(pawn, preload("res://resources/passive_abilities/ailments/ailment_sleep.tres"))
	BattleEffects.create_impact_sleep(pawn)

static func afflict_berserk(pawn: PawnComponents) -> void:
	afflict(pawn, preload("res://resources/passive_abilities/ailments/ailment_berserk.tres"))
	BattleEffects.create_impact_berserk(pawn)

static func afflict_confusion(pawn: PawnComponents) -> void:
	afflict(pawn, preload("res://resources/passive_abilities/ailments/ailment_confusion.tres"))
	BattleEffects.create_impact_confusion(pawn)

static func afflict_charm(pawn: PawnComponents) -> void:
	afflict(pawn, preload("res://resources/passive_abilities/ailments/ailment_charm.tres"))
	BattleEffects.create_impact_charm(pawn)

static func afflict_doom(pawn: PawnComponents) -> void:
	afflict(pawn, preload("res://resources/passive_abilities/ailments/ailment_doom.tres"))
	BattleEffects.create_impact_doom(pawn)

static func afflict_instant_death(pawn: PawnComponents) -> void:
	afflict(pawn, preload("res://resources/passive_abilities/ailments/ailment_instant_death.tres"))
	BattleEffects.create_impact_instant_death(pawn)
