extends CastSpellActiveScript

class_name WeakenStatActiveScript

func effect_body() -> void:
	for target in targets:
		tween.tween_callback(EffectAfflict.afflict_debuff.bind(target, get_debuff_affliction()))

func get_debuff_affliction() -> Resource:
	return null
