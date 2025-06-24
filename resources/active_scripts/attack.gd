extends ActiveScript

func start():
	var tween: Tween = create_tween()
	tween.tween_callback(BattleEffects.create_attack_swing.bind(user))
	tween.tween_interval(3.0/60)
	tween.tween_callback(user.node.start_attack)
	tween.tween_interval(1.0/60)
	
	for target in targets:
		var damage = BattleCalcs.get_base_damage_physical(user, target)
		tween.tween_callback(EffectPhysicalAttack.deal_damage.bind(user, target, damage, user.variables.get_weapon_type()))
	
	tween.tween_callback(end_script)
