extends Node

const AP_FLAGPOLE: float = 10000
var pawns: Array[PawnComponents]

func init_pawns(pawns_player: Array[PawnComponents], pawns_enemy: Array[PawnComponents]):
	for pawn in pawns_player:
		pawns.append(pawn)
	
	for pawn in pawns_enemy:
		pawns.append(pawn)
	
	for pawn in pawns:
		pawn.turn_system = self

func get_min_ticks_up_flagpole() -> float:
	var min_ticks = AP_FLAGPOLE + 1
	
	for pawn in pawns:
		var remaining_ap = AP_FLAGPOLE - pawn.variables.ap
		var ticks = remaining_ap / pawn.variables.get_speed()
		
		if ticks < min_ticks:
			min_ticks = ticks
	
	return min_ticks

func pass_ticks() -> void:
	var min_ticks = get_min_ticks_up_flagpole()
	
	for pawn in pawns:
		var add_ap = min_ticks * pawn.variables.get_speed()
		
		pawn.variables.ap = pawn.variables.ap + add_ap

func get_max_ap() -> float:
	var max_ap = 0
	
	for pawn in pawns:
		if pawn.variables.ap > max_ap:
			max_ap = pawn.variables.ap
	
	return max_ap

func get_top_pawns() -> Array[PawnComponents]:
	var max_ap = get_max_ap()
	var top_pawns: Array[PawnComponents] = []
	
	for pawn in pawns:
		if pawn.variables.ap == max_ap:
			top_pawns.append(pawn)
	
	return top_pawns

func get_action_taker() -> PawnComponents:
	var top_pawns = get_top_pawns()
	var random_index = randi_range(0, top_pawns.size() - 1)
	
	return top_pawns[random_index]

func take_actions() -> void:
	pass_ticks()
	
	var action_taker = get_action_taker()
	
	action_taker.variables.ap = action_taker.variables.ap - AP_FLAGPOLE
	action_taker.take_action()

func _ready() -> void:
	take_actions()
