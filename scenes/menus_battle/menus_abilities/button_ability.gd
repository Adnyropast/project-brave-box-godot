extends Button

var pawn: PawnComponents
var menu_node: Control
var active_ability: ActiveAbility

func close_menu():
	menu_node.get_parent().remove_child(menu_node)

func open_menu_target():
	var menu_target = preload("res://scenes/menus_battle/menus_target/menu_target.tscn").instantiate()
	
	menu_target.menu_battle = menu_node
	menu_target.pawn = pawn
	menu_target.active_ability = active_ability
	
	get_tree().root.add_child(menu_target)

func _on_pressed() -> void:
	open_menu_target()
	close_menu()
