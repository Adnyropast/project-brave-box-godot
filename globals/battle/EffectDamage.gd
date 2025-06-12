extends Node

class_name EffectDamage

static func deal_damage(pawn: PawnComponents, damage: int, type: Types.Damage):
	var resist_multiplier = pawn.variables.get_damage_type_multiplier(type)
	damage = (int)(resist_multiplier * damage)
	damage = pawn.variables.multiply_damage(damage)
	pawn.variables.hp = pawn.variables.hp - damage
	
	if pawn.variables.hp < 0:
		pawn.variables.hp = 0
	
	if pawn.variables.is_ko():
		pawn.variables.on_ko()
	else:
		var damage_data = DamageData.new()
		
		damage_data.damage = damage
		damage_data.type = type
		
		pawn.variables.on_hurt(damage_data)
	
	if pawn.variables.hp == 0 && pawn.vanishes_on_defeat:
		BattleEffects.create_vanish_effect(pawn)
		start_vanish(pawn)
	
	if damage >= 0:
		BattlePopups.create_damage_popup(pawn, damage)
	else:
		BattlePopups.create_healing_popup(pawn, -damage)
	
	if resist_multiplier < 0:
		BattlePopups.create_absorb_popup(pawn)
	elif resist_multiplier == 0:
		BattlePopups.create_immune_popup(pawn)
	elif resist_multiplier < 1:
		BattlePopups.create_resist_popup(pawn)
	elif resist_multiplier > 1:
		BattlePopups.create_weak_popup(pawn)
	
	if pawn.variables.state_defend:
		BattleEffects.create_impact_defend(pawn)
	
	BattleEffects.create_impact_typed(pawn, type)
	
	if not pawn.variables.state_defend and damage > 0:
		pawn.node.start_hurt()
	
	if pawn.player_panel:
		pawn.player_panel.set_current_hp(pawn.variables.hp)

static func start_vanish(pawn: PawnComponents):
	pawn.node.get_node("Sprite3D").hide()
	
	remove_pawn_system(pawn)
	
	var tween: Tween = pawn.node.create_tween()
	tween.tween_callback(remove_pawn_board.bind(pawn)).set_delay(3)

static func remove_pawn_system(pawn: PawnComponents):
	pawn.turn_system.pawns.erase(pawn)
	pawn.tree.root.get_node("BattleComponents").pawns_enemy.erase(pawn)
	pawn.tree.root.get_node("BattleComponents").on_enemy_defeated(pawn)

static func remove_pawn_board(pawn: PawnComponents):
	pawn.node.get_parent().remove_child(pawn.node)
