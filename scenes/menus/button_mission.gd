extends Button

var mission: Mission

func _on_pressed() -> void:
	BattleScene.enter_battle(mission)

func show_mark_new() -> void:
	$Control/MarkNew.show()

func hide_mark_new() -> void:
	$Control/MarkNew.hide()
