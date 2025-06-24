extends UseItemActiveScript

class_name UseThrowingWeaponActiveScript

func effect_body() -> void:
	for target in targets:
		var damage = 1000
		tween.tween_callback(EffectPhysicalAttack.deal_damage.bind(user, target, damage, get_weapon_type()))

func get_weapon_type() -> Types.Damage:
	return Types.Damage.PHYSICAL
