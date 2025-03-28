extends Button

var pawn: PawnComponents
var target: PawnComponents
var menu_target: Control

func _on_pressed() -> void:
	menu_target.close_menu()
	
	var targets: Array[PawnComponents] = [target]
	
	pawn.confirm_targets(targets)
