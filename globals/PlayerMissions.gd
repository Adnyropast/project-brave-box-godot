extends Node

var missions_cleared: Array[Mission] = []

func clear_mission(mission: Mission) -> void:
	if mission.completable and not missions_cleared.has(mission):
		missions_cleared.append(mission)

func is_mission_cleared(mission: Mission) -> bool:
	return missions_cleared.has(mission)
