extends Node3D

var pawns_player: Array[PawnComponents]
var pawns_enemy: Array[PawnComponents]

func init_pawns(_pawns_player: Array[PawnComponents], _pawns_enemy: Array[PawnComponents]) -> void:
	pawns_player = _pawns_player
	pawns_enemy = _pawns_enemy

func place_pawns_player():
	var i = 0
	
	for pawn in pawns_player:
		var node = pawn.node
		
		if(i == 0):
			$"Players/Player A".add_child(node)
		elif(i == 1):
			$"Players/Player B".add_child(node)
		elif(i == 2):
			$"Players/Player C".add_child(node)
		elif(i == 3):
			$"Players/Player D".add_child(node)
		
		i = i + 1

func place_pawns_enemy():
	var i = 0
	
	for pawn in pawns_enemy:
		var node = pawn.node
		
		if(i == 0):
			$"Enemies/Enemy A".add_child(node)
		elif(i == 1):
			$"Enemies/Enemy B".add_child(node)
		elif(i == 2):
			$"Enemies/Enemy C".add_child(node)
		elif(i == 3):
			$"Enemies/Enemy D".add_child(node)
		elif(i == 4):
			$"Enemies/Enemy E".add_child(node)
		elif(i == 5):
			$"Enemies/Enemy F".add_child(node)
		
		i = i + 1

func _ready() -> void:
	place_pawns_player()
	place_pawns_enemy()
