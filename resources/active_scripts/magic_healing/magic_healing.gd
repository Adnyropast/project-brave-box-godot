extends CastSpellActiveScript

func effect_body() -> void:
	for target in targets:
		var healing = BattleCalcs.get_base_healing(user)
		tween.tween_callback(EffectHealing.heal_amount.bind(target, healing))
