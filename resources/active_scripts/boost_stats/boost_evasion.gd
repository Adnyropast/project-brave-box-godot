extends ActiveScript

func start():
	user.node.start_cast()
	BattleEffects.create_magic_cast(user)
	
	for target in targets:
		EffectAfflict.afflict_buff(target, preload("res://resources/passive_abilities/stat_buffs/buff_eva.tres"))
