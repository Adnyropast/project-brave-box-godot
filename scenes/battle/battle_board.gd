extends Node3D

var battle: Battle

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

func place_pawns_enemy():
	var i = 0
	
	for enemy in battle.enemy_party:
		var pawn = preload("res://scenes/battle/battle_pawn.tscn").instantiate()
		
		pawn.get_node("Sprite3D").texture = enemy.image_std
		
		if(i == 0):
			$"Enemies/Enemy A".add_child(pawn)
		elif(i == 1):
			$"Enemies/Enemy B".add_child(pawn)
		elif(i == 2):
			$"Enemies/Enemy C".add_child(pawn)
		elif(i == 3):
			$"Enemies/Enemy D".add_child(pawn)
		elif(i == 4):
			$"Enemies/Enemy E".add_child(pawn)
		elif(i == 5):
			$"Enemies/Enemy F".add_child(pawn)
		
		i = i + 1

func _ready() -> void:
	place_pawns_player()
	place_pawns_enemy()
