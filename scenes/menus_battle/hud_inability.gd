extends Control

func set_message(message: String) -> void:
	$PanelContainer/MarginContainer/Label.text = message
