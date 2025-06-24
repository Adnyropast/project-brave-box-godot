extends ActiveScript

func start():
	var tween: Tween = create_tween()
	tween.tween_interval(3.0/60)
	
	for target in targets:
		var damage = 500
		tween.tween_callback(EffectDamage.deal_damage.bind(target, damage, Types.Damage.POISON))
	
	tween.tween_callback(end_script)
