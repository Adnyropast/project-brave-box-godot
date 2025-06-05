extends Control

var tree: SceneTree

func _ready() -> void:
	update_money()

func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("cancel")):
		close_pause()

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

func open_menu_stats():
	Menus.close_menu(self)
	
	var menu = preload("res://scenes/menus_stats/menu_stats.tscn").instantiate()
	menu.menu_pause = self
	Menus.open_menu(menu)

func _on_tree_entered() -> void:
	tree = get_tree()
	tree.paused = true

func _on_button_close_pressed() -> void:
	close_pause()

func _on_button_formation_pressed() -> void:
	open_menu_formation()

func _on_button_items_pressed() -> void:
	open_menu_items()

func _on_button_stats_pressed() -> void:
	open_menu_stats()

func update_money() -> void:
	$MarginContainer2/PanelContainer/MarginContainer/HBoxContainer/LabelMoney.text = str(PlayerParty.money)
