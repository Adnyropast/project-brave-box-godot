extends Node

var dynamic_battle_camera: bool = true
var debug_mode: bool = false

func toggle_dynamic_battle_camera() -> void:
	dynamic_battle_camera = not dynamic_battle_camera

func toggle_debug() -> void:
	debug_mode = not debug_mode
