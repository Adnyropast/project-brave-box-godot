extends Node

var missions_cleared: Array[Mission] = []
var missions_next: Array[Mission] = []

func _ready() -> void:
	missions_next.append(load("res://resources/missions/battle_plains.tres"))

func clear_mission(mission: Mission) -> void:
	if mission.completable and not missions_cleared.has(mission):
		update_next_missions(mission)
		missions_cleared.append(mission)
	
	missions_next.erase(mission)

func poi_has_new_missions(point_of_interest: PointOfInterest) -> bool:
	for mission in point_of_interest.missions:
		if missions_next.has(mission):
			return true
	
	return false

func update_next_missions(mission: Mission) -> void:
	missions_next.append_array(mission.unlocks)

func filter_next_missions(missions: Array[Mission]) -> Array[Mission]:
	var res: Array[Mission] = []
	
	for mission in missions:
		if missions_next.has(mission):
			res.append(mission)
	
	return res

func filter_missions_cleared(missions: Array[Mission]) -> Array[Mission]:
	var res: Array[Mission] = []
	
	for mission in missions:
		if missions_cleared.has(mission):
			res.append(mission)
	
	return res
