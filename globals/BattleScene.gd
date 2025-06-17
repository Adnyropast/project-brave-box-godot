extends Node

class_name BattleScene

static func enter_battle(mission: Mission) -> void:
	var tree: SceneTree = Engine.get_main_loop()
	
	for child in tree.root.get_children():
		tree.root.remove_child(child)
	
	tree.change_scene_to_packed(mission.battle.arena)
	
	var battle_components = preload("res://scenes/battle/battle_components.tscn").instantiate()
	battle_components.init(mission)
	tree.root.add_child(battle_components)
	
	tree.paused = false
