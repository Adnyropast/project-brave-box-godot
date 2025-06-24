extends UseItemActiveScript

func effect_body() -> void:
	for target in targets:
		tween.tween_callback(EffectMPHealing.heal_mp_amount.bind(target, 100))
