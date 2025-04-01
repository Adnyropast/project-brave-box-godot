extends ActiveScript

func start():
	user.node.start_attack()
	create_user_effect()
	
	for target in targets:
		deal_damage(target, 1000)

func create_user_effect():
	var effect_node = preload("res://scenes/battle_effects/attack_swing.tscn").instantiate()
	
	user.node.add_child(effect_node)

func deal_damage(pawn: PawnComponents, damage: int):
	pawn.variables.hp = pawn.variables.hp - damage
	
	if pawn.variables.hp < 0:
		pawn.variables.hp = 0
	
	create_damage_popup(pawn, damage)
	create_target_effect(pawn)
	pawn.node.start_hurt()
	
	if pawn.player_panel:
		pawn.player_panel.set_current_hp(pawn.variables.hp)

func create_damage_popup(pawn: PawnComponents, damage: int):
	var popup = preload("res://scenes/battle_popups/damage_hp.tscn").instantiate()
	pawn.node.add_child(popup)
	popup.place_popup(pawn)
	popup.set_value(damage)

func create_target_effect(pawn: PawnComponents):
	var effect_node = preload("res://scenes/battle_effects/impact_physical.tscn").instantiate()
	
	pawn.node.add_child(effect_node)
