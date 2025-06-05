extends Node

const MAX_ITEMS: int = 99

var items: Array[ItemVariables] = [
	ItemVariables.new(preload("res://resources/items/potion.tres"), 12),
	ItemVariables.new(preload("res://resources/items/full_potion.tres"), 4),
	ItemVariables.new(preload("res://resources/items/ether.tres"), 6),
	ItemVariables.new(preload("res://resources/items/full_ether.tres"), 2),
]

func find_item(item: Item) -> ItemVariables:
	for iv in items:
		if iv.item == item:
			return iv
	
	return null

func get_count(item: Item) -> int:
	var iv = find_item(item)
	
	if iv:
		return iv.count
	
	return 0

func expend_item(item: Item):
	var iv = find_item(item)
	
	if iv:
		iv.count = iv.count - 1
		
		if iv.count <= 0:
			items.erase(iv)

func add_item(item: Item, count: int) -> void:
	var iv = find_item(item)
	
	if not iv:
		iv = ItemVariables.new(item, 0)
		items.append(iv)
	
	iv.count = iv.count + count
	
	if iv.count > MAX_ITEMS:
		iv.count = MAX_ITEMS
