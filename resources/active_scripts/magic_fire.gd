extends ActiveScript

func start():
	user.node.start_cast()
	BattleEffects.create_magic_cast(user)
	
	for target in targets:
		if not target.variables.is_ko():
			EffectDamage.deal_damage(target, 1000, BattleEffects.Type.TYPE_FIRE)
