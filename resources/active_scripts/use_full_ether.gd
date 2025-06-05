extends ActiveScript

func start():
	user.node.start_cast()
	
	for target in targets:
		EffectMPHealing.heal_mp_amount(target, 9999)
