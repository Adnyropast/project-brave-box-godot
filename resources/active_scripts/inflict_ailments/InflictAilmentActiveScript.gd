extends CastSpellActiveScript

class_name InflictAilmentActiveScript

func effect_body() -> void:
	for target in targets:
		tween.tween_callback(get_affliction_callable().bind(target))

func get_affliction_callable() -> Callable:
	return EffectAfflict.afflict_poison
