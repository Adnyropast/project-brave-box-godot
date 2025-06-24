extends Node

class_name BattleEffects

static func create_attack_swing(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/attack_swing.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_magic_cast(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/magic_cast.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_physical(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_physical/impact_physical.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_severing(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_physical/impact_severing.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_cutting(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_physical/impact_cutting.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_piercing(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_physical/impact_piercing.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_blasting(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_physical/impact_blasting.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_bludgeoning(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_physical/impact_bludgeoning.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_magical(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_elements/impact_magical.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_fire(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_elements/impact_fire.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_water(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_elements/impact_water.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_lightning(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_elements/impact_lightning.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_earth(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_elements/impact_earth.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_wind(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_elements/impact_wind.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_light(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_elements/impact_light.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_dark(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_elements/impact_dark.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_healing(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impact_healing.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_typed(pawn: PawnComponents, type: Types.Damage):
	if type == Types.Damage.PHYSICAL:
		create_impact_physical(pawn)
	elif type == Types.Damage.SEVERING:
		create_impact_severing(pawn)
	elif type == Types.Damage.CUTTING:
		create_impact_cutting(pawn)
	elif type == Types.Damage.PIERCING:
		create_impact_piercing(pawn)
	elif type == Types.Damage.BLASTING:
		create_impact_blasting(pawn)
	elif type == Types.Damage.BLUDGEONING:
		create_impact_bludgeoning(pawn)
	elif type == Types.Damage.MAGICAL:
		create_impact_magical(pawn)
	elif type == Types.Damage.FIRE:
		create_impact_fire(pawn)
	elif type == Types.Damage.WATER:
		create_impact_water(pawn)
	elif type == Types.Damage.LIGHTNING:
		create_impact_lightning(pawn)
	elif type == Types.Damage.EARTH:
		create_impact_earth(pawn)
	elif type == Types.Damage.WIND:
		create_impact_wind(pawn)
	elif type == Types.Damage.LIGHT:
		create_impact_light(pawn)
	elif type == Types.Damage.DARK:
		create_impact_dark(pawn)
	elif type == Types.Damage.POISON:
		create_impact_poison(pawn)
	elif type == Types.Damage.DEATH:
		create_impact_instant_death(pawn)

static func create_vanish_effect(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/vanish.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_defending_effect(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/defending.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_defend(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impact_hit_defend.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_buff(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_stats/impact_buff.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_debuff(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_stats/impact_debuff.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_poison(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_ailments/impact_poison.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_blindness(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_ailments/impact_blindness.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_silence(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_ailments/impact_silence.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_sleep(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_ailments/impact_sleep.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_berserk(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_ailments/impact_berserk.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_confusion(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_ailments/impact_confusion.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_charm(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_ailments/impact_charm.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_doom(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_ailments/impact_doom.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func create_impact_instant_death(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impacts_ailments/impact_instant_death.tscn").instantiate()
	
	position_effect(effect_node, pawn.node)

static func shake_pawn(pawn: PawnComponents):
	var shake_node = pawn.node.get_shake_node()
	
	var tween: Tween = shake_node.create_tween()
	tween.tween_property(shake_node, "position", 0.03 * Vector3(-2, 0, 1), 0.1).from_current()
	tween.tween_property(shake_node, "position", 0.02 * Vector3(2, 0, -1), 0.1).from_current()
	tween.tween_property(shake_node, "position", 0.01 * Vector3(-2, 0, 1), 0.1).from_current()
	tween.tween_property(shake_node, "position", Vector3.ZERO, 0.1).from_current()

static func position_effect(effect_node: Node3D, pawn_node: Node3D) -> void:
	pawn_node.get_tree().root.add_child(effect_node)
	effect_node.global_position = pawn_node.global_position
