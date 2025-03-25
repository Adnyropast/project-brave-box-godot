extends Node3D

func place_pawns_player():
	var i = 0
	
	for party_member in PlayerParty.team:
		var pawn = preload("res://scenes/battle/battle_pawn.tscn").instantiate()
		
		pawn.get_node("Sprite3D").texture = party_member.image_std
		
		if(i == 0):
			$"Players/Player A".add_child(pawn)
		elif(i == 1):
			$"Players/Player B".add_child(pawn)
		elif(i == 2):
			$"Players/Player C".add_child(pawn)
		elif(i == 3):
			$"Players/Player D".add_child(pawn)
		
		i = i + 1

func _ready() -> void:
	place_pawns_player()
