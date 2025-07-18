extends Node

class_name EnemyActions

static func take_action(pawn: PawnComponents):
	var active_ability = pick_ability(pawn)
	var targets = pick_targets(pawn, active_ability)
	
	pawn.confirm_targets(active_ability, targets)

static func pick_ability(pawn: PawnComponents):
	var active_abilities = pawn.variables.get_active_abilities_all()
	
	var active_ability = active_abilities[randi_range(0, active_abilities.size() - 1)]
	
	return active_ability

static func get_target_options(pawn: PawnComponents, active_ability: ActiveAbility):
	var options = []
	
	if active_ability.targets_self():
		options.append([pawn])
	
	if active_ability.can_target_single():
		if active_ability.allies_by_default:
			for ally in pawn.allies:
				options.append([ally])
		else:
			for enemy in pawn.enemies:
				options.append([enemy])
	
	if active_ability.can_target_multiple():
		if active_ability.allies_by_default:
			options.append(pawn.allies.duplicate())
		else:
			options.append(pawn.enemies.duplicate())
	
	return options

static func pick_targets(pawn: PawnComponents, active_ability: ActiveAbility) -> Array[PawnComponents]:
	var options = get_target_options(pawn, active_ability)
	var option: Array[PawnComponents] = []
	
	option.append_array(options[randi_range(0, options.size() - 1)])
	
	return option
