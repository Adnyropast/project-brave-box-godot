extends Control

var tree: SceneTree

func _init() -> void:
	FocusButtons.set_focus_on_draw(self)

func close_menu():
	tree.root.remove_child(self)

func close_pause():
	close_menu()
	tree.paused = false

func open_menu_formation():
	close_menu()
	
	var menu_formation_node = preload("res://scenes/menus_formation/menu_formation.tscn").instantiate()
	menu_formation_node.menu_pause = self
	tree.root.add_child(menu_formation_node)

func open_menu_items():
	Menus.close_menu(self)
	
	var menu = preload("res://scenes/menus_items/menu_items.tscn").instantiate()
	menu.menu_pause = self
	Menus.open_menu(menu)

func open_menu_equipment():
	Menus.close_menu(self)
	
	var menu = preload("res://scenes/menus_equipment/menu_equipment.tscn").instantiate()
	menu.menu_pause = self
	Menus.open_menu(menu)

func open_menu_abilities():
	Menus.close_menu(self)
	
	var menu = preload("res://scenes/menus_abilities/menu_abilities.tscn").instantiate()
	menu.menu_pause = self
	Menus.open_menu(menu)

func open_menu_stats():
	Menus.close_menu(self)
	
	var menu = preload("res://scenes/menus_stats/menu_stats.tscn").instantiate()
	menu.menu_pause = self
	Menus.open_menu(menu)

func open_menu_settings() -> void:
	Menus.close_menu(self)
	
	var menu = preload("res://scenes/menus_settings/menu_settings.tscn").instantiate()
	menu.menu_pause = self
	Menus.open_menu(menu)

func _on_tree_entered() -> void:
	tree = get_tree()
	tree.paused = true
	
	update_money()
	update_character_panels()

func _on_button_close_pressed() -> void:
	close_pause()

func _on_button_formation_pressed() -> void:
	open_menu_formation()

func _on_button_items_pressed() -> void:
	open_menu_items()

func _on_button_equipment_pressed() -> void:
	open_menu_equipment()

func _on_button_abilities_pressed() -> void:
	open_menu_abilities()

func _on_button_stats_pressed() -> void:
	open_menu_stats()

func _on_button_settings_pressed() -> void:
	open_menu_settings()

func update_money() -> void:
	$MarginContainer2/PanelContainer/MarginContainer/HBoxContainer/LabelMoney.text = str(PlayerParty.money)

func update_character_panels() -> void:
	var container = $MarginContainer3/VBoxContainer
	
	for child in container.get_children():
		container.remove_child(child)
	
	for party_member in PlayerParty.team:
		var panel = preload("res://scenes/menus_pause/pause_player_character_panel.tscn").instantiate()
		
		panel.set_party_member(party_member)
		
		container.add_child(panel)
