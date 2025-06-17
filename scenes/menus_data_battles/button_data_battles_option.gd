extends Button

var menu_data_battles: Control
var enemy: Enemy

func _on_pressed() -> void:
	menu_data_battles.set_enemy(enemy)
