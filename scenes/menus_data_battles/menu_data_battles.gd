extends Control

var menu_cancel: Control
var enemy_party: Array[Enemy] = [null, null, null, null, null, null]
var selected_slot: int
var danger_level: int = 1

func _init() -> void:
	FocusButtons.set_focus_on_draw(self)

func _ready() -> void:
	update_slots()
	update_options()
	update_danger_level()

func _on_button_lv_minus_pressed() -> void:
	danger_level = danger_level - 1
	
	if danger_level < 1:
		danger_level = 1
	
	update_danger_level()

func _on_button_lv_plus_pressed() -> void:
	danger_level = danger_level + 1
	
	if danger_level > 99:
		danger_level = 99
	
	update_danger_level()

func _on_button_close_pressed() -> void:
	Menus.close_menu(self)
	Menus.open_menu(menu_cancel)

func _on_button_remove_pressed() -> void:
	set_enemy(null)

func _on_button_confirm_pressed() -> void:
	var mission: Mission = Mission.new()
	
	mission.completable = false
	mission.battle = Battle.new()
	mission.battle.arena = preload("res://scenes/arenas/arena_animant.tscn")
	mission.battle.enemy_party = get_enemies()
	mission.battle.danger_level = danger_level
	
	BattleScene.enter_battle(mission)

func update_slots() -> void:
	var container = $MarginContainer/VBoxContainer/VBoxContainerSlots
	
	for child in container.get_children():
		container.remove_child(child)
	
	for i in range(0, 6):
		var button = preload("res://scenes/menus_data_battles/button_data_battles_slot.tscn").instantiate()
		
		button.text = get_slot_name(i)
		button.menu_data_battles = self
		button.slot = i
		
		container.add_child(button)

func get_slot_name(slot: int) -> String:
	if enemy_party[slot]:
		return enemy_party[slot].name
	
	return "---"

func set_selected_slot(slot: int) -> void:
	selected_slot = slot

func update_options() -> void:
	var container = $MarginContainer2/ScrollContainer/VBoxContainer/VBoxContainerOptions
	
	for child in container.get_children():
		container.remove_child(child)
	
	for enemy in Enemies.get_all_enemies():
		var button = preload("res://scenes/menus_data_battles/button_data_battles_option.tscn").instantiate()
		
		button.text = enemy.name
		button.menu_data_battles = self
		button.enemy = enemy
		
		container.add_child(button)

func set_enemy(enemy: Enemy) -> void:
	enemy_party[selected_slot] = enemy
	
	update_slots()

func get_enemies() -> Array[Enemy]:
	var res: Array[Enemy] = []
	
	for enemy in enemy_party:
		if enemy:
			res.append(enemy)
	
	return res

func update_danger_level():
	$MarginContainer/VBoxContainer/PanelContainer/MarginContainer/HBoxContainer/LabelEnemyLevel.text = str(danger_level)
