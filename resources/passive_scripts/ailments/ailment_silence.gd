extends PassiveScript

func on_attach() -> void:
	attach_effect(preload("res://scenes/battle_effects/states_ailments/state_silence.tscn"))

func on_detach() -> void:
	detach_effect()

func disable_ability(active_script: ActiveScript) -> String:
	if active_script.ability.voice:
		return "Cannot use while silenced!"
	
	return ""
