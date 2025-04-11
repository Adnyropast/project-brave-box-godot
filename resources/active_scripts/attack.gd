extends ActiveScript

func start():
	user.node.start_attack()
	BattleEffects.create_attack_swing(user)
	
	for target in targets:
		EffectPhysicalAttack.deal_damage(user, target, 1000, BattleEffects.Type.TYPE_PHYSICAL)
