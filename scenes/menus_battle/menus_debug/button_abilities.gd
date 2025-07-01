extends Button

var menu_cancel: Control
var pawn: PawnComponents
var abilities: Array[ActiveAbility]

func _on_pressed() -> void:
	AbilitiesMenu.open_menu_abilities(
		menu_cancel,
		pawn,
		abilities,
	)
