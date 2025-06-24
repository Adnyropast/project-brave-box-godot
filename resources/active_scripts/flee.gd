extends ActiveScript

func start():
	var tween: Tween = create_tween()
	tween.tween_interval(3.0/60)
	
	for target in targets:
		tween.tween_callback(EffectFlee.flee.bind(target))
	
	tween.tween_callback(end_script)
