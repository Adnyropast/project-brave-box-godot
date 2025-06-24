extends UseItemActiveScript

func effect_body() -> void:
	for target in targets:
		tween.tween_callback(EffectHealing.heal_amount.bind(target, 1000))
