extends Node3D

func set_view_standard() -> void:
	if not $Camera3DStd.current:
		$Camera3DStd.make_current()
		$Camera3DStd/AnimationPlayer.play("start")

func set_view_allies_vs_enemies() -> void:
	if not $Camera3DAvE.current:
		$Camera3DAvE.make_current()
		$Camera3DAvE/AnimationPlayer.play("start")

func set_view_enemies_vs_allies() -> void:
	if not $Camera3DEvA.current:
		$Camera3DEvA.make_current()
		$Camera3DEvA/AnimationPlayer.play("start")

func set_view_allies_focus() -> void:
	if not $Camera3DAF.current:
		$Camera3DAF.make_current()
		$Camera3DAF/AnimationPlayer.play("start")

func set_view_enemies_focus() -> void:
	if not $Camera3DEF.current:
		$Camera3DEF.make_current()
		$Camera3DEF/AnimationPlayer.play("start")
