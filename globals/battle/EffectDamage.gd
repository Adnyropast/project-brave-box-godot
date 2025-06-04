extends Node

class_name EffectDamage

static func deal_damage(pawn: PawnComponents, damage: int, type: BattleEffects.Type):
	damage = pawn.variables.multiply_damage(damage)
	pawn.variables.hp = pawn.variables.hp - damage
	
	if pawn.variables.hp < 0:
		pawn.variables.hp = 0
	
	if pawn.variables.is_ko():
		pawn.variables.on_ko()
	
	if pawn.variables.hp == 0 && pawn.vanishes_on_defeat:
		BattleEffects.create_vanish_effect(pawn)
		start_vanish(pawn)
	
	BattlePopups.create_damage_popup(pawn, damage)
	
	if pawn.variables.state_defend:
		BattleEffects.create_impact_defend(pawn)
	
	BattleEffects.create_impact_typed(pawn, type)
	
	if not pawn.variables.state_defend:
		pawn.node.start_hurt()
	
	if pawn.player_panel:
		pawn.player_panel.set_current_hp(pawn.variables.hp)

static func start_vanish(pawn: PawnComponents):
	pawn.node.get_node("Sprite3D").hide()
	
	remove_pawn_system(pawn)
	
	var tween: Tween = pawn.node.create_tween()
	tween.tween_callback(remove_pawn_board.bind(pawn)).set_delay(3)

static func remove_pawn_system(pawn: PawnComponents):
	pawn.turn_system.pawns.erase(pawn)
	pawn.tree.root.get_node("BattleComponents").pawns_enemy.erase(pawn)
	pawn.tree.root.get_node("BattleComponents").on_enemy_defeated(pawn)

static func remove_pawn_board(pawn: PawnComponents):
	pawn.node.get_parent().remove_child(pawn.node)
