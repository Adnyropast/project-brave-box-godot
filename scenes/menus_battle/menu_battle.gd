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

func _on_button_heal_pressed() -> void:
	tree = get_tree()
	
	var active_ability = preload("res://resources/active_abilities/magic_healing.tres")
	
	close_menu()
	open_menu_target(active_ability)

func _on_button_revive_pressed() -> void:
	tree = get_tree()
	
	var active_ability = preload("res://resources/active_abilities/magic_reviving.tres")
	
	close_menu()
	open_menu_target(active_ability)

func _on_button_abilities_pressed() -> void:
	tree = get_tree()
	
	close_menu()
	
	var menu_abilities = preload("res://scenes/menus_battle/menus_abilities/menu_abilities.tscn").instantiate()
	
	menu_abilities.menu_cancel = self
	menu_abilities.pawn = pawn
	
	var abilities: Array[ActiveAbility] = [
		preload("res://resources/active_abilities/magic_fire.tres"),
		preload("res://resources/active_abilities/magic_water.tres"),
		preload("res://resources/active_abilities/magic_lightning.tres"),
		preload("res://resources/active_abilities/magic_earth.tres"),
		preload("res://resources/active_abilities/magic_wind.tres"),
		preload("res://resources/active_abilities/magic_light.tres"),
		preload("res://resources/active_abilities/magic_dark.tres"),
	]
	
	menu_abilities.update_abilities(abilities)
	
	tree.root.add_child(menu_abilities)

func _on_button_tests_pressed() -> void:
	Menus.close_menu(self)
	
	var menu_abilities = preload("res://scenes/menus_battle/menus_abilities/menu_abilities.tscn").instantiate()
	
	menu_abilities.menu_cancel = self
	menu_abilities.pawn = pawn
	
	var abilities: Array[ActiveAbility] = [
		preload("res://resources/active_abilities/expend_mp_999.tres"),
	]
	
	menu_abilities.update_abilities(abilities)
	
	Menus.open_menu(menu_abilities)

func _on_button_defend_pressed() -> void:
	Menus.close_menu(self)
	
	var active_ability = preload("res://resources/active_abilities/defend.tres")
	pawn.confirm_targets(active_ability, [pawn])

func _on_button_items_pressed() -> void:
	Menus.close_menu(self)
	
	var menu_abilities = preload("res://scenes/menus_battle/menus_abilities/menu_abilities.tscn").instantiate()
	
	menu_abilities.menu_cancel = self
	menu_abilities.pawn = pawn
	
	var abilities: Array[ActiveAbility] = []
	
	for iv in PlayerInventory.items:
		if iv.item.ability:
			iv.item.ability.item_cost = iv.item
			abilities.append(iv.item.ability)
	
	menu_abilities.update_abilities(abilities)
	
	Menus.open_menu(menu_abilities)

func _on_button_change_weapon_pressed() -> void:
	Menus.close_menu(self)
	
	var menu = preload("res://scenes/menus_battle/menus_change_weapon/menu_change_weapon.tscn").instantiate()
	
	menu.menu_cancel = self
	menu.pawn = pawn
	
	Menus.open_menu(menu)

func _on_button_buffs_pressed() -> void:
	Menus.close_menu(self)
	
	var menu_abilities = preload("res://scenes/menus_battle/menus_abilities/menu_abilities.tscn").instantiate()
	
	menu_abilities.menu_cancel = self
	menu_abilities.pawn = pawn
	
	var abilities: Array[ActiveAbility] = [
		preload("res://resources/active_abilities/boost_stats/boost_physical_attack.tres"),
		preload("res://resources/active_abilities/boost_stats/boost_physical_defense.tres"),
		preload("res://resources/active_abilities/boost_stats/boost_magical_attack.tres"),
		preload("res://resources/active_abilities/boost_stats/boost_magical_defense.tres"),
		preload("res://resources/active_abilities/boost_stats/boost_speed.tres"),
		preload("res://resources/active_abilities/boost_stats/boost_aim.tres"),
		preload("res://resources/active_abilities/boost_stats/boost_evasion.tres"),
		preload("res://resources/active_abilities/boost_stats/boost_critical_chance.tres"),
		preload("res://resources/active_abilities/boost_stats/boost_restorative_power.tres"),
	]
	
	menu_abilities.update_abilities(abilities)
	
	Menus.open_menu(menu_abilities)

func _on_button_debuffs_pressed() -> void:
	Menus.close_menu(self)
	
	var menu_abilities = preload("res://scenes/menus_battle/menus_abilities/menu_abilities.tscn").instantiate()
	
	menu_abilities.menu_cancel = self
	menu_abilities.pawn = pawn
	
	var abilities: Array[ActiveAbility] = [
		preload("res://resources/active_abilities/weaken_stats/weaken_physical_attack.tres"),
		preload("res://resources/active_abilities/weaken_stats/weaken_physical_defense.tres"),
		preload("res://resources/active_abilities/weaken_stats/weaken_magical_attack.tres"),
		preload("res://resources/active_abilities/weaken_stats/weaken_magical_defense.tres"),
		preload("res://resources/active_abilities/weaken_stats/weaken_speed.tres"),
		preload("res://resources/active_abilities/weaken_stats/weaken_aim.tres"),
		preload("res://resources/active_abilities/weaken_stats/weaken_evasion.tres"),
		preload("res://resources/active_abilities/weaken_stats/weaken_critical_chance.tres"),
		preload("res://resources/active_abilities/weaken_stats/weaken_restorative_power.tres"),
	]
	
	menu_abilities.update_abilities(abilities)
	
	Menus.open_menu(menu_abilities)
