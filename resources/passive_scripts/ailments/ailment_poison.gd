extends PassiveScript

func on_attach() -> void:
	attach_effect(preload("res://scenes/battle_effects/states_ailments/state_poison.tscn"))

func on_turn_end() -> void:
	var active_ability: ActiveAbility = preload("res://resources/active_abilities/effects/poison_damage.tres")
	var active_script: ActiveScript = active_ability.gdscript.new()
	
	active_script.ability = active_ability
	active_script.turn_system = user.turn_system
	active_script.user = null
	active_script.targets = [user]
	
	user.turn_system.add_active_script(active_script)

func on_detach() -> void:
	detach_effect()
