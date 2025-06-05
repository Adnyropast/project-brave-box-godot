extends Control

var menu_cancel: Control
var pawn: PawnComponents

func clear_abilities():
	for child in $MarginContainer/VBoxContainer/VBoxContainer.get_children():
		$MarginContainer/VBoxContainer/VBoxContainer.remove_child(child)

func fill_abilities(abilities: Array[ActiveAbility]):
	for ability in abilities:
		var button = preload("res://scenes/menus_battle/menus_abilities/button_ability.tscn").instantiate()
		
		button.set_label(ability.name)
		
		if ability.item_cost:
			button.set_aside("× " + str(PlayerInventory.get_count(ability.item_cost)) + "")
		elif ability.mp_cost > 0:
			button.set_aside("" + str(ability.mp_cost) + " MP")
		
		button.pawn = pawn
		button.menu_node = self
		button.active_ability = ability
		
		$MarginContainer/VBoxContainer/VBoxContainer.add_child(button)

func update_abilities(abilities: Array[ActiveAbility]):
	clear_abilities()
	fill_abilities(abilities)

func close_menu():
	get_parent().remove_child(self)

func _on_button_cancel_pressed() -> void:
	get_tree().root.add_child(menu_cancel)
	close_menu()
