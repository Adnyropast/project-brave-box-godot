extends ActiveScript

func start():
	user.node.start_cast()
	BattleEffects.create_magic_cast(user)
	
	for target in targets:
		if not target.variables.is_ko():
			var healing = BattleCalcs.get_base_healing(user)
			EffectHealing.heal_amount(target, healing)
