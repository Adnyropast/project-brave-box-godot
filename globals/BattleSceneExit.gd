extends Node

class_name BattleSceneExit

static func exit_battle() -> void:
	play_fade_out()

static func play_fade_out() -> void:
	var tree: SceneTree = Engine.get_main_loop()
	
	var fade_out: Node = preload("res://scenes/transition_fade_black/transition_fade_out_black.tscn").instantiate()
	
	fade_out.on_end = func(_anim_name: StringName): play_fade_in()
	tree.root.add_child(fade_out)

static func play_fade_in() -> void:
	empty_tree()
	
	var tree: SceneTree = Engine.get_main_loop()
	
	change_to_scene_map()
	
	var fade_in: Node = preload("res://scenes/transition_fade_black/transition_fade_in_black.tscn").instantiate()
	
	tree.root.add_child(fade_in)

static func change_to_scene_map() -> void:
	var tree: SceneTree = Engine.get_main_loop()
	
	tree.root.add_child(load("res://scenes/map/map_compositia.tscn").instantiate())

static func empty_tree() -> void:
	var tree: SceneTree = Engine.get_main_loop()
	
	for child in tree.root.get_children():
		tree.root.remove_child(child)
