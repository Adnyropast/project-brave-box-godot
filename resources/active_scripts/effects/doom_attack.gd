extends ActiveScript

func start():
	var tween: Tween = create_tween()
	tween.tween_interval(3.0/60)
	
	for target in targets:
		var damage = 99999
		tween.tween_callback(EffectDamage.deal_damage.bind(target, damage, Types.Damage.DEATH))
	
	tween.tween_callback(end_script)
