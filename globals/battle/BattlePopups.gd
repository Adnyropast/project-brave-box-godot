extends Node

class_name BattlePopups

static func create_damage_popup(pawn: PawnComponents, damage: int):
	var popup = preload("res://scenes/battle_popups/damage_hp.tscn").instantiate()
	pawn.node.add_child(popup)
	popup.place_popup(pawn)
	popup.set_value(damage)

static func create_healing_popup(pawn: PawnComponents, amount: int):
	var popup = preload("res://scenes/battle_popups/healing_hp.tscn").instantiate()
	pawn.node.add_child(popup)
	popup.place_popup(pawn)
	popup.set_value(amount)
