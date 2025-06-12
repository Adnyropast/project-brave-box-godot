extends PassiveScript

var turns: int = 0

func on_attach() -> void:
	attach_effect(preload("res://scenes/battle_effects/states_ailments/state_sleep.tscn"))

func on_turn_end() -> void:
	turns = turns + 1
	
	if turns > 2:
		detach()

func on_hurt(damage_data: DamageData) -> void:
	if damage_data.is_physical():
		detach()

func on_detach() -> void:
	detach_effect()

func block_turn() -> ActiveScript:
	var active_ability: ActiveAbility = preload("res://resources/active_abilities/effects/sleep.tres")
	var active_script: ActiveScript = active_ability.gdscript.new()
	
	active_script.ability = active_ability
	active_script.turn_system = user.turn_system
	active_script.user = user
	active_script.targets = [user]
	
	return active_script
