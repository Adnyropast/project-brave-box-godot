extends ActiveScript

func start():
	user.node.start_cast()
	create_user_effect()
	
	for target in targets:
		heal_amount(target, 1000)

func heal_amount(pawn: PawnComponents, amount: int):
	pawn.variables.hp = pawn.variables.hp + amount
	
	if pawn.variables.hp > pawn.variables.get_max_hp():
		pawn.variables.hp = pawn.variables.get_max_hp()
	
	create_healing_popup(pawn, amount)
	create_target_effect(pawn)
	
	if pawn.player_panel:
		pawn.player_panel.set_current_hp(pawn.variables.hp)

func create_healing_popup(pawn: PawnComponents, amount: int):
	var popup = preload("res://scenes/battle_popups/healing_hp.tscn").instantiate()
	pawn.node.add_child(popup)
	popup.place_popup(pawn)
	popup.set_value(amount)

func create_user_effect():
	var effect_node = preload("res://scenes/battle_effects/magic_cast.tscn").instantiate()
	
	user.node.add_child(effect_node)

func create_target_effect(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impact_healing.tscn").instantiate()
	
	pawn.node.add_child(effect_node)
