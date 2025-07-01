extends Control

var menu_cancel: Control
var pawn: PawnComponents

func _ready() -> void:
	fill_buttons()

func _on_button_cancel_pressed() -> void:
	Menus.switch_menus(self, menu_cancel)

func fill_buttons() -> void:
	var container = $MarginContainer/VBoxContainer/VBoxContainerButtons
	
	for child in container.get_children():
		container.remove_child(child)
	
	for ability_set in Abilities.get_debug_abilities_sets():
		var button = preload("res://scenes/menus_battle/menus_debug/button_abilities.tscn").instantiate()
		
		button.text = ability_set.name
		button.menu_cancel = self
		button.pawn = pawn
		button.abilities = ability_set.get_active_abilities()
		
		container.add_child(button)
