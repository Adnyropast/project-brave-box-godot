extends ActiveScript

func start():
	user.node.start_attack()
	BattleEffects.create_attack_swing(user)
	
	for target in targets:
		EffectDamage.deal_damage(target, 1000, BattleEffects.Type.TYPE_PHYSICAL)
