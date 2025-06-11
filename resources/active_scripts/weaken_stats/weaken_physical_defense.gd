extends ActiveScript

func start():
	user.node.start_cast()
	BattleEffects.create_magic_cast(user)
	
	for target in targets:
		EffectAfflict.afflict_debuff(target, preload("res://resources/passive_abilities/stat_debuffs/debuff_p_def.tres"))
