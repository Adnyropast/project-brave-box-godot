extends PassiveScript

func on_attach() -> void:
	attach_effect(preload("res://scenes/battle_effects/states_stats/state_debuff.tscn"))

func on_detach() -> void:
	detach_effect()

func get_eva_multiplier() -> float:
	return 0.6
