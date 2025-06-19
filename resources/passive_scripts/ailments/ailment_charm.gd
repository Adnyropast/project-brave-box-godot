extends PassiveScript

func on_attach() -> void:
	attach_effect(preload("res://scenes/battle_effects/states_ailments/state_charm.tscn"))

func on_hurt(damage_data: DamageData) -> void:
	if damage_data.is_physical():
		detach()

func on_detach() -> void:
	detach_effect()

func block_turn() -> ActiveScript:
	var active_abilities = user.variables.get_active_abilities_all()
	
	var active_ability = active_abilities[randi_range(0, active_abilities.size() - 1)]
	var active_script: ActiveScript = active_ability.gdscript.new()
	
	active_script.ability = active_ability
	active_script.turn_system = user.turn_system
	active_script.user = user
	active_script.targets = CharmedActions.pick_targets_charmed(user, active_ability)
	
	return active_script
