extends PassiveScript

func on_attach() -> void:
	attach_effect(preload("res://scenes/battle_effects/states_ailments/state_berserk.tscn"))

func on_detach() -> void:
	detach_effect()

func get_p_atk_multiplier() -> float:
	return 1.5

func get_p_def_multiplier() -> float:
	return 0.5

func block_turn() -> ActiveScript:
	var active_abilities = [
		preload("res://resources/active_abilities/attack.tres"),
		preload("res://resources/active_abilities/magic_fire.tres"),
	]
	
	var active_ability = active_abilities[randi_range(0, active_abilities.size() - 1)]
	var active_script: ActiveScript = active_ability.gdscript.new()
	
	active_script.ability = active_ability
	active_script.turn_system = user.turn_system
	active_script.user = user
	active_script.targets = EnemyActions.pick_targets(user, active_ability)
	
	return active_script
