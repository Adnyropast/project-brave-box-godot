extends Node

class_name Shops

static func purchase_item(item: Item) -> void:
	if PlayerParty.money >= item.price:
		PlayerParty.money = PlayerParty.money - item.price
		PlayerInventory.add_item(item, 1)
