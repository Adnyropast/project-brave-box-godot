extends Node

var mission: Mission
var turn_system: Node
var battle_board: Node3D
var pawns_player: Array[PawnComponents]
var pawns_enemy: Array[PawnComponents]
var hud_player: Control
var pot_exp: int

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
	
	var aliases = EnemyAliases.create_aliases(mission.battle.enemy_party)
	var i = 0
	
	for enemy in mission.battle.enemy_party:
		var pawn = PawnComponents.init_from_enemy(enemy, aliases[i])
		
		pawn.tree = get_tree()
		pawn.allies = pawns_enemy
		pawn.enemies = pawns_player
		
		pawns_enemy.append(pawn)
		
		i = i + 1
	
	var battle_board = preload("res://scenes/battle/battle_board.tscn").instantiate()
	battle_board.init_pawns(pawns_player, pawns_enemy)
	tree.root.add_child(battle_board)
	
	hud_player = preload("res://scenes/menus_battle/hud_player.tscn").instantiate()
	hud_player.init_players(pawns_player)
	tree.root.add_child(hud_player)
	
	var control_info = preload("res://scenes/menus_battle/menus_info/control_info.tscn").instantiate()
	control_info.battle = self
	control_info.pawns = pawns_enemy + pawns_player
	tree.root.add_child(control_info)
	
	var turn_system = preload("res://scenes/battle/turn_system.tscn").instantiate()
	turn_system.init_pawns(pawns_player, pawns_enemy)
	turn_system.battle_components = self
	tree.root.add_child(turn_system)

func all_players_defeated() -> bool:
	for pawn in pawns_player:
		if not pawn.variables.is_ko():
			return false
	
	return true

func lose_battle():
	var tree = get_tree()
	
	await tree.create_timer(1).timeout
	
	tree.change_scene_to_file("res://scenes/map/map_compositia.tscn")
	clean_tree_root()

func clean_tree_root():
	var tree = get_tree()
	
	for child in tree.root.get_children():
		tree.root.remove_child(child)

func on_enemy_defeated(_pawn: PawnComponents) -> void:
	pot_exp = pot_exp + 1000

func all_enemies_defeated() -> bool:
	for pawn in pawns_enemy:
		if not pawn.variables.is_ko():
			return false
	
	return true

func win_battle():
	var tree = get_tree()
	
	hud_player.hide()
	
	var victory_screen = preload("res://scenes/victory/victory.tscn").instantiate()
	victory_screen.pot_exp = pot_exp
	tree.root.add_child(victory_screen)
	
	for party_member in PlayerParty.team:
		party_member.add_exp(pot_exp)

func no_player_present() -> bool:
	return pawns_player.size() == 0

func end_battle():
	var tree = get_tree()
	
	tree.change_scene_to_file("res://scenes/map/map_compositia.tscn")
	clean_tree_root()

func hide_ui():
	hud_player.hide()
	
	for pawn in pawns_player:
		pawn.menu_node.hide()

func show_ui():
	hud_player.show()
	
	for pawn in pawns_player:
		pawn.menu_node.show()
