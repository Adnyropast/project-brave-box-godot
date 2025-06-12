extends Node

class_name CharmedActions

static func get_target_options(pawn: PawnComponents, active_ability: ActiveAbility):
	var options = []
	
	if active_ability.targets_self():
		options.append([pawn])
	
	if active_ability.can_target_single():
		if active_ability.allies_by_default:
			for ally in pawn.enemies:
				options.append([ally])
		else:
			for enemy in pawn.allies:
				options.append([enemy])
	
	if active_ability.can_target_multiple():
		if active_ability.allies_by_default:
			options.append(pawn.enemies.duplicate())
		else:
			options.append(pawn.allies.duplicate())
	
	return options

static func pick_targets_charmed(pawn: PawnComponents, active_ability: ActiveAbility) -> Array[PawnComponents]:
	var options = get_target_options(pawn, active_ability)
	var option: Array[PawnComponents] = []
	
	option.append_array(options[randi_range(0, options.size() - 1)])
	
	return option
