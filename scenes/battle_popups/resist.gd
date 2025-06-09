extends Control

func _ready() -> void:
	await get_tree().create_timer(1.0).timeout
	
	get_parent().remove_child(self)

func place_popup(pawn: PawnComponents):
	var viewport: Viewport = get_viewport()
	var camera: Camera3D = viewport.get_camera_3d()
	
	if camera:
		position = camera.unproject_position(pawn.node.global_position) + Vector2.DOWN * 32
