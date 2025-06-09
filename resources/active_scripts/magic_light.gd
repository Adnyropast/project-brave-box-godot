extends ActiveScript

func start():
	user.node.start_cast()
	BattleEffects.create_magic_cast(user)
	
	for target in targets:
		if not target.variables.is_ko():
			var damage = BattleCalcs.get_base_damage_magical(user, target)
			EffectDamage.deal_damage(target, damage, Types.Damage.LIGHT)
