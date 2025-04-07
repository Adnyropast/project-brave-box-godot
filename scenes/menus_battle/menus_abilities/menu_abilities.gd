extends Control

var menu_cancel: Control
var pawn: PawnComponents

func clear_abilities():
	for child in $MarginContainer/VBoxContainer/VBoxContainer.get_children():
		$MarginContainer/VBoxContainer/VBoxContainer.remove_child(child)

func fill_abilities():
	var abilities: Array[ActiveAbility] = [
		preload("res://resources/active_abilities/magic_fire.tres"),
		preload("res://resources/active_abilities/magic_water.tres"),
		preload("res://resources/active_abilities/magic_lightning.tres"),
		preload("res://resources/active_abilities/magic_earth.tres"),
		preload("res://resources/active_abilities/magic_wind.tres"),
		preload("res://resources/active_abilities/magic_light.tres"),
		preload("res://resources/active_abilities/magic_dark.tres"),
	]
	
	for ability in abilities:
		var button = preload("res://scenes/menus_battle/menus_abilities/button_ability.tscn").instantiate()
		
		button.text = ability.name
		button.pawn = pawn
		button.menu_node = self
		button.active_ability = ability
		
		$MarginContainer/VBoxContainer/VBoxContainer.add_child(button)

func update_abilities():
	clear_abilities()
	fill_abilities()

func close_menu():
	get_parent().remove_child(self)

func _on_button_cancel_pressed() -> void:
	get_tree().root.add_child(menu_cancel)
	close_menu()
