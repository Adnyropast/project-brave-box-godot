extends PassiveScript

func on_attach() -> void:
	attach_effect(preload("res://scenes/battle_effects/states_stats/state_buff.tscn"))

func on_detach() -> void:
	detach_effect()

func get_m_atk_multiplier() -> float:
	return 1.5
