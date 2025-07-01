extends Control

var on_end: Callable

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if on_end:
		on_end.call(anim_name)
	
	queue_free()
