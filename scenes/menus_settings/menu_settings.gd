extends Control

var menu_pause: Control

func _ready() -> void:
	update_button_debug()

func _on_button_close_pressed() -> void:
	Menus.close_menu(self)
	Menus.open_menu(menu_pause)

func _on_button_debug_pressed() -> void:
	PlayerSettings.toggle_debug()
	update_button_debug()

func update_button_debug() -> void:
	if PlayerSettings.debug_mode:
		$MarginContainer/VBoxContainer/ButtonDebug.text = "Debug Mode (" +  "On" + ")"
	else:
		$MarginContainer/VBoxContainer/ButtonDebug.text = "Debug Mode (" +  "Off" + ")"
