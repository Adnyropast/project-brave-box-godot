extends Control

var menu_poi: Control

func _ready() -> void:
	update_money()
	fill_buttons()
	update_character_panels()

func _on_button_close_pressed() -> void:
	Menus.close_menu(self)
	Menus.open_menu(menu_poi)

func update_money() -> void:
	$MarginContainer2/PanelContainer/MarginContainer/HBoxContainer/LabelMoney.text = str(PlayerParty.money)

func fill_buttons() -> void:
	var inn_item = preload("res://scenes/menus_inn/inn_item.tscn").instantiate()
	
	inn_item.menu_inn = self
	inn_item.set_text("Rest at the Inn")
	inn_item.set_price(120)
	
	$MarginContainer/VBoxContainer/VBoxContainer.add_child(inn_item)

func update_character_panels() -> void:
	var container = $MarginContainer3/VBoxContainer
	
	for child in container.get_children():
		container.remove_child(child)
	
	for party_member in PlayerParty.team:
		var panel = preload("res://scenes/menus_pause/pause_player_character_panel.tscn").instantiate()
		
		panel.set_party_member(party_member)
		
		container.add_child(panel)
