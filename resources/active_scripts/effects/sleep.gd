extends ActiveScript

func start():
	var tween: Tween = create_tween()
	tween.tween_interval(3.0/60)
	
	tween.tween_callback(BattleEffects.create_impact_sleep.bind(user))
	
	tween.tween_callback(end_script)
