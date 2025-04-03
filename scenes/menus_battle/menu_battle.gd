extends Control

var tree: SceneTree
var pawn: PawnComponents

func close_menu():
	get_parent().remove_child(self)

func open_menu_target(active_ability: ActiveAbility):
	var menu_target = preload("res://scenes/menus_battle/menus_target/menu_target.tscn").instantiate()
	
	menu_target.menu_battle = self
	menu_target.pawn = pawn
	menu_target.active_ability = active_ability
	
	tree.root.add_child(menu_target)

func _on_button_attack_pressed() -> void:
	tree = get_tree()
	
	var active_ability = preload("res://resources/active_abilities/attack.tres")
	
	close_menu()
	open_menu_target(active_ability)

func _on_button_target_pressed() -> void:
	tree = get_tree()
	
	var active_ability = preload("res://resources/active_abilities/target.tres")
	
	close_menu()
	open_menu_target(active_ability)

func _on_button_pass_pressed() -> void:
	close_menu()
	
	pawn.pass_turn()

func _on_button_flee_pressed() -> void:
	var active_ability = preload("res://resources/active_abilities/flee.tres")
	
	close_menu()
	pawn.confirm_targets(active_ability, pawn.allies.duplicate())
