extends PassiveScript

var counter: int = 4

func on_attach() -> void:
	attach_effect(preload("res://scenes/battle_effects/states_ailments/state_doom.tscn"))

func on_turn_end() -> void:
	counter = counter - 1
	
	if counter <= 0:
		var active_ability: ActiveAbility = preload("res://resources/active_abilities/effects/doom_attack.tres")
		var active_script: ActiveScript = active_ability.gdscript.new()
		
		active_script.ability = active_ability
		active_script.turn_system = user.turn_system
		active_script.user = null
		active_script.targets = [user]
		
		user.turn_system.add_active_script(active_script)
		
		detach()

func on_detach() -> void:
	detach_effect()
