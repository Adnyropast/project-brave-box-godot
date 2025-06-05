extends ActiveScript

func start():
	user.node.start_cast()
	
	for target in targets:
		EffectHealing.heal_amount(target, 9999)
