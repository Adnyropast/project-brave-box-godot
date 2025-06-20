extends Resource

class_name PointOfInterest

@export var name: String
@export var inn: bool
@export var shops: Array[Shop]
@export var data_battles: bool
@export var missions: Array[Mission]

func has_menus() -> bool:
	if inn:
		return true
	
	elif shops.size() > 0:
		return true
	
	elif data_battles:
		return true
	
	elif PlayerMissions.filter_next_missions(missions).size() > 0:
		return true
	
	elif PlayerMissions.filter_missions_cleared(missions).size() > 0:
		return true
	
	return false
