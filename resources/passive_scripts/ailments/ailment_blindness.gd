extends PassiveScript

func on_attach() -> void:
	attach_effect(preload("res://scenes/battle_effects/states_ailments/state_blindness.tscn"))

func on_detach() -> void:
	detach_effect()

func get_aim_multiplier() -> float:
	return 0
