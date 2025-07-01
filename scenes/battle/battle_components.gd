extends Node

var mission: Mission
var turn_system: Node
var battle_board: Node3D
var pawns_player: Array[PawnComponents]
var pawns_enemy: Array[PawnComponents]
var hud_player: Control
var pot_exp: int
var pot_money: int

func init(_mission: Mission) -> void:
	mission = _mission

func _ready() -> void:
	var tree = get_tree()
	
	for party_member in PlayerParty.team:
		var pawn = PawnComponents.init_from_party_member(party_member)
		
		pawn.battle = self
		pawn.tree = get_tree()
		pawn.allies = pawns_player
		pawn.enemies = pawns_enemy
		
		pawns_player.append(pawn)
	
	var aliases = EnemyAliases.create_aliases(mission.battle.enemy_party)
	var i = 0
	
	for enemy in mission.battle.enemy_party:
		var pawn = PawnComponents.init_from_enemy(enemy, aliases[i], mission.battle.danger_level)
		
		pawn.battle = self
		pawn.tree = get_tree()
		pawn.allies = pawns_enemy
		pawn.enemies = pawns_player
		
		pawns_enemy.append(pawn)
		
		i = i + 1
	
	battle_board = preload("res://scenes/battle/battle_board.tscn").instantiate()
	battle_board.init_pawns(pawns_player, pawns_enemy)
	tree.root.add_child(battle_board)
	
	hud_player = preload("res://scenes/menus_battle/hud_player.tscn").instantiate()
	hud_player.init_players(pawns_player)
	tree.root.add_child(hud_player)
	
	var tween: Tween = create_tween()
	tween.tween_callback(intro_end).set_delay(1.0)

func all_players_defeated() -> bool:
	for pawn in pawns_player:
		if not pawn.variables.is_ko():
			return false
	
	return true

func lose_battle():
	var tree = get_tree()
	
	await tree.create_timer(1).timeout
	
	end_battle()

func on_enemy_defeated(pawn: PawnComponents) -> void:
	pot_exp = pot_exp + EnemyRewards.get_exp(pawn.variables.get_level()) * 100
	pot_money = pot_money + EnemyRewards.get_money(pawn.variables.get_level()) * 100

func all_enemies_defeated() -> bool:
	for pawn in pawns_enemy:
		if not pawn.variables.is_ko():
			return false
	
	return true

func win_battle():
	on_battle_end()
	
	var tree = get_tree()
	
	hud_player.hide()
	
	var victory_screen = preload("res://scenes/victory/victory.tscn").instantiate()
	victory_screen.pot_exp = pot_exp
	victory_screen.pot_money = pot_money
	tree.root.add_child(victory_screen)
	
	PlayerMissions.clear_mission(mission)
	
	PlayerParty.add_money(pot_money)
	
	for party_member in PlayerParty.team:
		party_member.add_exp(pot_exp)

func no_player_present() -> bool:
	return pawns_player.size() == 0

func end_battle():
	on_battle_end()
	
	BattleSceneExit.exit_battle()

func on_battle_end():
	for pawn in pawns_player:
		pawn.variables.party_member.current_hp = pawn.variables.hp
		pawn.variables.party_member.current_mp = pawn.variables.mp
	
	if all_players_defeated():
		for party_member in PlayerParty.team:
			party_member.current_hp = 1

func hide_ui():
	hud_player.hide()

func show_ui():
	hud_player.show()

func intro_end() -> void:
	var control_info = preload("res://scenes/menus_battle/menus_info/control_info.tscn").instantiate()
	control_info.battle = self
	control_info.pawns = pawns_enemy + pawns_player
	hud_player.add_child(control_info)
	
	turn_system = preload("res://scenes/battle/turn_system.tscn").instantiate()
	turn_system.init_pawns(pawns_player, pawns_enemy)
	turn_system.battle_components = self
	get_tree().root.add_child(turn_system)
