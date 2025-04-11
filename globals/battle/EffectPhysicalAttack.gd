extends Node

class_name EffectPhysicalAttack

static func deal_damage(user: PawnComponents, target: PawnComponents, damage: int, type: BattleEffects.Type):
	if check_miss(user, target):
		BattlePopups.create_miss_popup(target)
	else:
		EffectDamage.deal_damage(target, damage, type)

static func check_miss(user: PawnComponents, target: PawnComponents) -> bool:
	var success_rate = user.variables.get_aim() - target.variables.get_eva()
	var random = randi_range(0, 99)
	
	return random >= success_rate
