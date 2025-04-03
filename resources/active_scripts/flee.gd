extends ActiveScript

func start():
	for target in targets:
		remove_pawn_system(target)

func remove_pawn_system(pawn: PawnComponents):
	pawn.turn_system.pawns.erase(pawn)
	pawn.tree.root.get_node("BattleComponents").pawns_player.erase(pawn)
	pawn.tree.root.get_node("BattleComponents").pawns_enemy.erase(pawn)
