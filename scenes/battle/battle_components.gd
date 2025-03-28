extends Node

var mission: Mission
var turn_system: Node
var battle_board: Node3D
var pawns_player: Array[PawnComponents]
var pawns_enemy: Array[PawnComponents]

func init(_mission: Mission) -> void:
	mission = _mission

func _ready() -> void:
	var tree = get_tree()
	
	for party_member in PlayerParty.team:
		var pawn = PawnComponents.init_from_party_member(party_member)
		
		pawn.tree = get_tree()
		pawn.allies = pawns_player
		pawn.enemies = pawns_enemy
		
		pawns_player.append(pawn)
	
	for enemy in mission.battle.enemy_party:
		var pawn = PawnComponents.init_from_enemy(enemy)
		
		pawn.tree = get_tree()
		pawn.allies = pawns_enemy
		pawn.enemies = pawns_player
		
		pawns_enemy.append(pawn)
	
	var battle_board = preload("res://scenes/battle/battle_board.tscn").instantiate()
	battle_board.init_pawns(pawns_player, pawns_enemy)
	tree.root.add_child(battle_board)
	
	var hud_player = preload("res://scenes/menus_battle/hud_player.tscn").instantiate()
	hud_player.init_players(pawns_player)
	tree.root.add_child(hud_player)
	
	var turn_system = preload("res://scenes/battle/turn_system.tscn").instantiate()
	turn_system.init_pawns(pawns_player, pawns_enemy)
	tree.root.add_child(turn_system)
