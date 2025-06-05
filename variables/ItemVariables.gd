extends Node

class_name ItemVariables

var item: Item
var count: int

func _init(_item: Item, _count: int) -> void:
	item = _item
	count = _count
