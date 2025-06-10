extends ActiveScript

func start():
	user.node.start_attack()
	BattleEffects.create_attack_swing(user)
	
	for target in targets:
		var damage = BattleCalcs.get_base_damage_physical(user, target)
		EffectPhysicalAttack.deal_damage(user, target, damage, user.variables.get_weapon_type())
