extends Control

var menu_pause: Control

func _ready() -> void:
	update_all()

func _on_button_close_pressed() -> void:
	Menus.close_menu(self)
	Menus.open_menu(menu_pause)

func _on_button_dynamic_battle_camera_pressed() -> void:
	PlayerSettings.toggle_dynamic_battle_camera()
	update_button_dynamic_battle_camera()

func _on_button_debug_pressed() -> void:
	PlayerSettings.toggle_debug()
	update_button_debug()

func update_all():
	update_button_debug()
	update_button_dynamic_battle_camera()

func update_button_dynamic_battle_camera() -> void:
	if PlayerSettings.dynamic_battle_camera:
		$MarginContainer/VBoxContainer/ButtonDynamicBattleCamera.text = "Dynamic Battle Camera (" + "On" + ")"
	else:
		$MarginContainer/VBoxContainer/ButtonDynamicBattleCamera.text = "Dynamic Battle Camera (" + "Off" + ")"

func update_button_debug() -> void:
	if PlayerSettings.debug_mode:
		$MarginContainer/VBoxContainer/ButtonDebug.text = "Debug Mode (" +  "On" + ")"
	else:
		$MarginContainer/VBoxContainer/ButtonDebug.text = "Debug Mode (" +  "Off" + ")"
