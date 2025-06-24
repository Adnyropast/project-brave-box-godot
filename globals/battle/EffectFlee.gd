extends Node

class_name EffectFlee

static func flee(pawn: PawnComponents) -> void:
	remove_pawn_system(pawn)

static func remove_pawn_system(pawn: PawnComponents) -> void:
	pawn.turn_system.pawns.erase(pawn)
	pawn.tree.root.get_node("BattleComponents").pawns_player.erase(pawn)
	pawn.tree.root.get_node("BattleComponents").pawns_enemy.erase(pawn)
