extends CastSpellActiveScript

class_name BoostStatActiveScript

func effect_body() -> void:
	for target in targets:
		tween.tween_callback(EffectAfflict.afflict_buff.bind(target, get_buff_affliction()))

func get_buff_affliction() -> Resource:
	return null
