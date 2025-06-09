extends ActiveScript

func start():
	user.node.start_cast()
	
	for target in targets:
		var damage = 1000
		EffectPhysicalAttack.deal_damage(user, target, damage, Types.Damage.BLASTING)
