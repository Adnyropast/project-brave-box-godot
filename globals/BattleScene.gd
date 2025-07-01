extends Node

class_name BattleScene

static func enter_battle(mission: Mission) -> void:
	play_fade_out(mission)

static func play_fade_out(mission: Mission) -> void:
	var tree: SceneTree = Engine.get_main_loop()
	
	var fade_out: Node = preload("res://scenes/transition_fade_black/transition_fade_out_black.tscn").instantiate()
	
	fade_out.on_end = func(_anim_name: StringName): play_screen(mission)
	tree.root.add_child(fade_out)

static func play_screen(mission: Mission) -> void:
	empty_tree()
	
	var tree: SceneTree = Engine.get_main_loop()
	
	var screen: Node = preload("res://scenes/screen_battle_start/screen_battle_start.tscn").instantiate()
	
	screen.on_end = func(_anim_name: StringName): play_fade_in(mission)
	tree.root.add_child(screen)

static func play_fade_in(mission: Mission) -> void:
	var tree: SceneTree = Engine.get_main_loop()
	
	change_to_scene_arena(mission)
	
	load_battle_components(mission)
	
	unpause()
	
	var fade_in: Node = preload("res://scenes/transition_fade_black/transition_fade_in_black.tscn").instantiate()
	
	tree.root.add_child(fade_in)

static func empty_tree() -> void:
	var tree: SceneTree = Engine.get_main_loop()
	
	for child in tree.root.get_children():
		tree.root.remove_child(child)

static func change_to_scene_arena(mission: Mission) -> void:
	var tree: SceneTree = Engine.get_main_loop()
	
	tree.root.add_child(mission.battle.arena.instantiate())

static func load_battle_components(mission: Mission) -> void:
	var tree: SceneTree = Engine.get_main_loop()
	
	var battle_components = preload("res://scenes/battle/battle_components.tscn").instantiate()
	battle_components.init(mission)
	tree.root.add_child(battle_components)

static func unpause() -> void:
	var tree: SceneTree = Engine.get_main_loop()
	
	tree.paused = false
