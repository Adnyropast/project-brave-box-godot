extends CastSpellActiveScript

class_name MagicElementActiveScript

func effect_body() -> void:
	for target in targets:
		var damage = BattleCalcs.get_base_damage_magical(user, target)
		tween.tween_callback(EffectDamage.deal_damage.bind(target, damage, get_element_type()))

func get_element_type() -> Types.Damage:
	return Types.Damage.MAGICAL
