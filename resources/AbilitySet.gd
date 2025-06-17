extends Resource

class_name AbilitySet

@export var name: String
@export var abilities: Array[ActiveAbility]

func get_active_abilities() -> Array[ActiveAbility]:
	var active_abilities: Array[ActiveAbility] = []
	
	for ability in abilities:
		if ability:
			active_abilities.append(ability)
	
	return active_abilities
