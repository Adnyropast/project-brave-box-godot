extends Node

const MAX_ITEMS: int = 99

var items: Array[ItemVariables] = [
	ItemVariables.new(preload("res://resources/items/potion.tres"), 12),
	ItemVariables.new(preload("res://resources/items/full_potion.tres"), 4),
	ItemVariables.new(preload("res://resources/items/ether.tres"), 6),
	ItemVariables.new(preload("res://resources/items/full_ether.tres"), 2),
	ItemVariables.new(preload("res://resources/items/throwing_weapons/throwing_stone.tres"), 2),
	ItemVariables.new(preload("res://resources/items/throwing_weapons/throwing_blade.tres"), 2),
	ItemVariables.new(preload("res://resources/items/throwing_weapons/throwing_knife.tres"), 2),
	ItemVariables.new(preload("res://resources/items/throwing_weapons/throwing_needle.tres"), 2),
	ItemVariables.new(preload("res://resources/items/throwing_weapons/throwing_bullet.tres"), 2),
	ItemVariables.new(preload("res://resources/items/throwing_weapons/throwing_bell.tres"), 2),
	ItemVariables.new(preload("res://resources/items/magic_bombs/void_bomb.tres"), 2),
	ItemVariables.new(preload("res://resources/items/magic_bombs/fire_bomb.tres"), 2),
	ItemVariables.new(preload("res://resources/items/magic_bombs/water_bomb.tres"), 2),
	ItemVariables.new(preload("res://resources/items/magic_bombs/lightning_bomb.tres"), 2),
	ItemVariables.new(preload("res://resources/items/magic_bombs/earth_bomb.tres"), 2),
	ItemVariables.new(preload("res://resources/items/magic_bombs/wind_bomb.tres"), 2),
	ItemVariables.new(preload("res://resources/items/magic_bombs/light_bomb.tres"), 2),
	ItemVariables.new(preload("res://resources/items/magic_bombs/dark_bomb.tres"), 2),
]

var weapons: Array[ItemVariables] = [
	ItemVariables.new(preload("res://resources/items/equipment/weapons/basic_sword.tres"), 1),
	ItemVariables.new(preload("res://resources/items/equipment/weapons/basic_axe.tres"), 1),
	ItemVariables.new(preload("res://resources/items/equipment/weapons/basic_dagger.tres"), 1),
	ItemVariables.new(preload("res://resources/items/equipment/weapons/basic_scroll.tres"), 1),
	ItemVariables.new(preload("res://resources/items/equipment/weapons/basic_spear.tres"), 1),
	ItemVariables.new(preload("res://resources/items/equipment/weapons/basic_bow.tres"), 1),
	ItemVariables.new(preload("res://resources/items/equipment/weapons/basic_gun.tres"), 1),
	ItemVariables.new(preload("res://resources/items/equipment/weapons/basic_extender.tres"), 1),
	ItemVariables.new(preload("res://resources/items/equipment/weapons/basic_staff.tres"), 1),
	ItemVariables.new(preload("res://resources/items/equipment/weapons/basic_shield.tres"), 1),
	ItemVariables.new(preload("res://resources/items/equipment/weapons/basic_harp.tres"), 1),
	ItemVariables.new(preload("res://resources/items/equipment/weapons/basic_tube.tres"), 1),
]

var headgear: Array[ItemVariables] = [
	ItemVariables.new(preload("res://resources/items/equipment/headgear/basic_headband.tres"), 1),
	ItemVariables.new(preload("res://resources/items/equipment/headgear/basic_helmet.tres"), 1),
	ItemVariables.new(preload("res://resources/items/equipment/headgear/basic_hat.tres"), 1),
	ItemVariables.new(preload("res://resources/items/equipment/headgear/basic_crown.tres"), 1),
]

var body_armor: Array[ItemVariables] = [
	ItemVariables.new(preload("res://resources/items/equipment/body_armor/basic_tunic.tres"), 1),
	ItemVariables.new(preload("res://resources/items/equipment/body_armor/basic_plate.tres"), 1),
	ItemVariables.new(preload("res://resources/items/equipment/body_armor/basic_coat.tres"), 1),
	ItemVariables.new(preload("res://resources/items/equipment/body_armor/basic_robe.tres"), 1),
]

var accessories: Array[ItemVariables] = [
	ItemVariables.new(preload("res://resources/items/equipment/accessories/basic_amulet.tres"), 1),
]

func get_item_list(item: Item) -> Array[ItemVariables]:
	if item is Weapon:
		return weapons
	elif item is Headgear:
		return headgear
	elif item is BodyArmor:
		return body_armor
	elif item is Accessory:
		return accessories
	
	return items

func find_item(item: Item) -> ItemVariables:
	var list = get_item_list(item)
	
	for iv in list:
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
			var list = get_item_list(item)
			list.erase(iv)

func add_item(item: Item, count: int) -> void:
	var iv = find_item(item)
	
	if not iv:
		iv = ItemVariables.new(item, 0)
		var list = get_item_list(item)
		list.append(iv)
	
	iv.count = iv.count + count
	
	if iv.count > MAX_ITEMS:
		iv.count = MAX_ITEMS
