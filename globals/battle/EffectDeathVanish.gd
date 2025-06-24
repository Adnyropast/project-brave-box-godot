extends Node

class_name EffectDeathVanish

static func start_vanish(pawn: PawnComponents) -> void:
	slide_back(pawn)

static func slide_back(pawn: PawnComponents) -> void:
	var tween: Tween = pawn.node.create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_QUAD)
	tween.tween_property(pawn.node, "position", Vector3(-2, 0, 0), 0.3).from_current()
	tween.tween_callback(vanish.bind(pawn))

static func vanish(pawn: PawnComponents):
	BattleEffects.create_vanish_effect(pawn)
	pawn.node.hide_sprite()
	
	remove_pawn_system(pawn)
	
	var tween: Tween = pawn.node.create_tween()
	tween.tween_callback(remove_pawn_board.bind(pawn)).set_delay(3)

static func remove_pawn_system(pawn: PawnComponents):
	pawn.turn_system.pawns.erase(pawn)
	pawn.tree.root.get_node("BattleComponents").pawns_enemy.erase(pawn)
	pawn.tree.root.get_node("BattleComponents").on_enemy_defeated(pawn)

static func remove_pawn_board(pawn: PawnComponents):
	pawn.node.get_parent().remove_child(pawn.node)
