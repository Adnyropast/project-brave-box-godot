class_name ItemAbilities
extends Node

static func get_player_item_abilities() -> Array[ActiveAbility]:
	var item_abilities: Array[ActiveAbility] = []
	
	for iv in PlayerInventory.items:
		if iv.item.ability:
			iv.item.ability.item_cost = iv.item
			item_abilities.append(iv.item.ability)
	
	return item_abilities
