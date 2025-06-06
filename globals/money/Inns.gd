extends Node

class_name Inns

static func rest(price: int) -> void:
	if PlayerParty.money >= price:
		PlayerParty.money = PlayerParty.money - price
		
		for party_member in PlayerParty.get_all_members():
			party_member.restore_hp()
			party_member.restore_mp()
