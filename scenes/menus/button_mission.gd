extends Button

var mission: Mission

func _on_pressed() -> void:
	BattleScene.enter_battle(mission)
