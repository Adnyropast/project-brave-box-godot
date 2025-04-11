extends ActiveScript

func start():
	for target in targets:
		target.variables.state_defend = true
		target.node.return_to_default()
		BattleEffects.create_defending_effect(target)
