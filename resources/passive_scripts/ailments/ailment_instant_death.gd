extends PassiveScript

func on_attach() -> void:
	EffectDamage.deal_damage(user, 99999, Types.Damage.DEATH)
