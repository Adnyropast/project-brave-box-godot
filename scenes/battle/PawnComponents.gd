extends Node

class_name PawnComponents

var character_data
var variables: PawnVariables
var node: CharacterBody3D
var player_panel: Node
var controlled_by_menu: bool
var menu_node: Control
var tree: SceneTree
var turn_system: Node
var action_circle: Node3D
var allies: Array[PawnComponents]
var enemies: Array[PawnComponents]

static func init_from_party_member(party_member: PartyMember) -> PawnComponents:
	var pawn_components = PawnComponents.new()
	
	pawn_components.controlled_by_menu = true
	
	pawn_components.variables.name_alias = party_member.name
	
	pawn_components.node = preload("res://scenes/battle/battle_pawn.tscn").instantiate()
	pawn_components.node.get_node("Sprite3D").texture = party_member.image_std
	
	pawn_components.menu_node = preload("res://scenes/menus_battle/menu_battle.tscn").instantiate()
	pawn_components.menu_node.pawn = pawn_components
	
	return pawn_components

static func init_from_enemy(enemy: Enemy) -> PawnComponents:
	var pawn_components = PawnComponents.new()
	
	pawn_components.controlled_by_menu = false
	
	pawn_components.variables.name_alias = enemy.name
	
	pawn_components.node = preload("res://scenes/battle/battle_pawn.tscn").instantiate()
	pawn_components.node.get_node("Sprite3D").texture = enemy.image_std
	
	return pawn_components

func _init() -> void:
	variables = PawnVariables.new()
	
	action_circle = preload("res://scenes/battle/action_circle.tscn").instantiate()

func place_action_circle():
	node.add_child(action_circle)

func remove_action_circle():
	node.remove_child(action_circle)

func take_action():
	place_action_circle()
	
	if controlled_by_menu:
		tree.root.add_child(menu_node)
	else:
		if randi_range(0, 1) == 0:
			pass_turn()
		else:
			confirm_targets(enemies)

func pass_turn():
	await tree.create_timer(1.0).timeout
	
	remove_action_circle()
	
	turn_system.take_actions()

func confirm_targets(targets: Array[PawnComponents]):
	for target in targets:
		var target_screen = preload("res://scenes/battle/target_screen.tscn").instantiate()
		
		target.node.add_child(target_screen)
	
	await tree.create_timer(1.0).timeout
	
	remove_action_circle()
	
	turn_system.take_actions()
