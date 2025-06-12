extends ActiveScript

func start():
	for target in targets:
		var damage = 99999
		EffectDamage.deal_damage(target, damage, Types.Damage.DEATH)
