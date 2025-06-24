extends ActiveScript

func start():
	var tween: Tween = create_tween()
	tween.tween_interval(1.0/60)
	
	for target in targets:
		tween.tween_callback(EffectDefend.defend.bind(target))
	
	tween.tween_callback(end_script)
