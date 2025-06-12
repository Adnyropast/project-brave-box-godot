extends ActiveScript

func start():
	for target in targets:
		var damage = 500
		EffectDamage.deal_damage(target, damage, Types.Damage.POISON)
