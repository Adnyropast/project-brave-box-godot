extends Container

var pawn: PawnComponents
var menu_node: Control
var active_ability: ActiveAbility

func close_menu():
	menu_node.get_parent().remove_child(menu_node)

func _on_pressed() -> void:
	TargetMenu.open_menu_target(
		menu_node,
		pawn,
		active_ability
	)

func set_label(text: String):
	$MarginContainer/HBoxContainer/Label.text = text

func set_aside(text: String):
	$MarginContainer/HBoxContainer/LabelAside.text = text
