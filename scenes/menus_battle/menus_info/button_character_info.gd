extends Button

var menu_info: Control
var pawn: PawnComponents

func _on_pressed() -> void:
	menu_info.update_info(pawn)
