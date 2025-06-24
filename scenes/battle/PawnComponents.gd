extends Node

class_name PawnComponents

var character_data
var variables: PawnVariables
var node: CharacterBody3D
var player_panel: PanelContainer
var controlled_by_menu: bool
var tree: SceneTree
var turn_system: Node
var action_circle: Node3D
var allies: Array[PawnComponents]
var enemies: Array[PawnComponents]
var vanishes_on_defeat: bool
var uses_player_inventory: bool
var battle: Node

static func init_from_party_member(party_member: PartyMemberVariables) -> PawnComponents:
	var pawn_components = PawnComponents.new()
	
	pawn_components.controlled_by_menu = true
	pawn_components.vanishes_on_defeat = false
	pawn_components.uses_player_inventory = true
	
	pawn_components.variables.init_from_party_member(party_member)
	
	pawn_components.node = preload("res://scenes/battle/battle_pawn.tscn").instantiate()
	pawn_components.node.init_from_party_member(pawn_components, party_member.party_member)
	
	pawn_components.player_panel = preload("res://scenes/menus_battle/player_character_panel.tscn").instantiate()
	pawn_components.player_panel.set_character_name(party_member.party_member.name)
	pawn_components.player_panel.set_current_hp(pawn_components.variables.hp)
	pawn_components.player_panel.set_current_mp(pawn_components.variables.mp)
	pawn_components.player_panel.set_max_hp(pawn_components.variables.get_max_hp())
	pawn_components.player_panel.set_max_mp(pawn_components.variables.get_max_mp())
	
	return pawn_components

static func init_from_enemy(enemy: Enemy, alias: String, level: int) -> PawnComponents:
	var pawn_components = PawnComponents.new()
	
	pawn_components.controlled_by_menu = false
	pawn_components.vanishes_on_defeat = true
	pawn_components.uses_player_inventory = false
	
	pawn_components.variables.init_from_enemy(enemy, alias, level)
	
	pawn_components.node = preload("res://scenes/battle/battle_pawn.tscn").instantiate()
	pawn_components.node.init_from_enemy(pawn_components, enemy)
	
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
	variables.on_turn_start()
	node.return_to_default_not_busy()
	
	var block_turn_ability = variables.block_turn()
	
	if block_turn_ability:
		block_turn_ability.template_start()
	else:
		if controlled_by_menu:
			open_menu()
		else:
			EnemyActions.take_action(self)

func end_action():
	variables.on_turn_end()
	remove_action_circle()

func pass_turn():
	await tree.create_timer(1.0).timeout
	end_action()

func confirm_targets(active_ability: ActiveAbility, targets: Array[PawnComponents]):
	var active_script: ActiveScript = active_ability.gdscript.new()
	
	active_script.ability = active_ability
	active_script.turn_system = turn_system
	active_script.user = self
	active_script.targets = targets
	active_script.template_start()

func open_menu() -> void:
	var menu_node: Control = preload("res://scenes/menus_battle/menu_battle.tscn").instantiate()
	menu_node.pawn = self
	battle.hud_player.add_child(menu_node)
