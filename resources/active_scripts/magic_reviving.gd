extends ActiveScript

func start():
	user.node.start_cast()
	BattleEffects.create_magic_cast(user)
	
	for target in targets:
		var healing = BattleCalcs.get_base_healing(user)
		EffectRevive.revive_amount(target, healing)
