extends Node3D

func _ready() -> void:
	await get_tree().create_timer(0.5).timeout
	
	get_parent().remove_child(self)
