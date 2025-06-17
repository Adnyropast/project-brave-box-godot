extends Node

const AP_FLAGPOLE: float = 10000
var pawns: Array[PawnComponents]
var battle_components: Node
var actives_queue: Array[ActiveScript]

func get_tick_eligible_pawns() -> Array[PawnComponents]:
	var res: Array[PawnComponents] = []
	
	for pawn in pawns:
		if not pawn.variables.is_ko():
			res.append(pawn)
	
	return res

func init_pawns(pawns_player: Array[PawnComponents], pawns_enemy: Array[PawnComponents]):
	for pawn in pawns_player:
		pawns.append(pawn)
	
	for pawn in pawns_enemy:
		pawns.append(pawn)
	
	for pawn in pawns:
		pawn.turn_system = self

func get_min_ticks_up_flagpole() -> float:
	var tick_pawns = get_tick_eligible_pawns()
	var min_ticks = AP_FLAGPOLE + 1
	
	for pawn in tick_pawns:
		var remaining_ap = AP_FLAGPOLE - pawn.variables.ap
		var ticks = remaining_ap / pawn.variables.get_speed()
		
		if ticks < min_ticks:
			min_ticks = ticks
	
	return min_ticks

func pass_ticks() -> void:
	var tick_pawns = get_tick_eligible_pawns()
	var min_ticks = get_min_ticks_up_flagpole()
	
	for pawn in tick_pawns:
		var add_ap = min_ticks * pawn.variables.get_speed()
		
		pawn.variables.ap = pawn.variables.ap + add_ap

func get_max_ap() -> float:
	var tick_pawns = get_tick_eligible_pawns()
	var max_ap = 0
	
	for pawn in tick_pawns:
		if pawn.variables.ap > max_ap:
			max_ap = pawn.variables.ap
	
	return max_ap

func get_top_pawns() -> Array[PawnComponents]:
	var tick_pawns = get_tick_eligible_pawns()
	var max_ap = get_max_ap()
	var top_pawns: Array[PawnComponents] = []
	
	for pawn in tick_pawns:
		if pawn.variables.ap == max_ap:
			top_pawns.append(pawn)
	
	return top_pawns

func get_action_taker() -> PawnComponents:
	var top_pawns = get_top_pawns()
	var random_index = randi_range(0, top_pawns.size() - 1)
	
	return top_pawns[random_index]

func take_actions() -> void:
	if battle_components.no_player_present():
		battle_components.end_battle()
	elif battle_components.all_players_defeated():
		battle_components.lose_battle()
	elif battle_components.all_enemies_defeated():
		battle_components.win_battle()
	elif actives_queue.size() > 0:
		var active_script: ActiveScript = actives_queue.pop_front()
		active_script.template_start()
	else:
		pass_ticks()
		
		var action_taker = get_action_taker()
		
		action_taker.variables.ap = action_taker.variables.ap - AP_FLAGPOLE
		action_taker.take_action()

func _ready() -> void:
	take_actions()

func add_active_script(active_script: ActiveScript) -> void:
	actives_queue.append(active_script)
