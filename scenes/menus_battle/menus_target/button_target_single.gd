extends Button

var pawn: PawnComponents
var target: PawnComponents
var menu_target: Control
var active_ability: ActiveAbility

func _on_pressed() -> void:
	menu_target.close_menu()
	
	var targets: Array[PawnComponents] = [target]
	
	pawn.confirm_targets(active_ability, targets)
