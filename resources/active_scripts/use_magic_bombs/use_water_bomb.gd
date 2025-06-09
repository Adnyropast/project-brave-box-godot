extends ActiveScript

func start():
	user.node.start_cast()
	
	for target in targets:
		var damage = 1000
		EffectDamage.deal_damage(target, damage, Types.Damage.WATER)
