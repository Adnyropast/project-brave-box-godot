extends UseItemActiveScript

class_name UseMagicBombActiveScript

func effect_body() -> void:
	for target in targets:
		var damage = 1000
		tween.tween_callback(EffectDamage.deal_damage.bind(target, damage, get_element_type()))

func get_element_type() -> Types.Damage:
	return Types.Damage.MAGICAL
