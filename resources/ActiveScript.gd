extends GDScript

class_name ActiveScript

var ability: ActiveAbility
var turn_system: Node
var user: PawnComponents
var targets: Array[PawnComponents]
var hud: Control
var hud_inability: Control

func start():
	end_script()

func template_start():
	redirect_targets()
	show_hud()
	
	if user:
		if user.ally_view:
			if targets.any(user.enemies.has):
				user.battle.camera_group.set_view_allies_vs_enemies()
			else:
				user.battle.camera_group.set_view_allies_focus()
		else:
			if targets.any(user.enemies.has):
				user.battle.camera_group.set_view_enemies_vs_allies()
			else:
				user.battle.camera_group.set_view_enemies_focus()
		
		var disable_message = user.variables.disable_ability(self)
		
		if disable_message:
			show_inability(disable_message)
		elif user.variables.mp >= ability.mp_cost:
			if ability.item_cost:
				BattleCosts.expend_item(user, ability.item_cost)
			
			BattleCosts.expend_mp(user, ability.mp_cost)
			start()
		else:
			show_inability("Not enough MP!")
	else:
		start()

static func filter_pawns_not_ko(pawns: Array[PawnComponents]):
	var res: Array[PawnComponents] = []
	
	for pawn in pawns:
		if not pawn.variables.is_ko():
			res.append(pawn)
	
	return res

func redirect_targets():
	if not ability.koed_targets:
		if targets.size() == 1:
			if targets[0].variables.is_ko():
				targets = filter_pawns_not_ko(targets[0].allies)
				
				if targets.size() > 0:
					targets = [targets[0]]
		else:
			targets = filter_pawns_not_ko(targets)

func template_end():
	var tween: Tween = Engine.get_main_loop().create_tween()
	
	tween.tween_callback(end_clear).set_delay(1)

func end_clear():
	hide_hud()
	
	if user:
		user.end_action()
	
	turn_system.take_actions()

func show_hud():
	hud = preload("res://scenes/menus_battle/hud_active_ability.tscn").instantiate()
	
	hud.set_label(ability.name)
	
	Engine.get_main_loop().root.add_child(hud)

func hide_hud():
	if hud.get_parent():
		hud.get_parent().remove_child(hud)

func show_inability(message: String):
	hud_inability = preload("res://scenes/menus_battle/hud_inability.tscn").instantiate()
	
	hud_inability.set_message(message)
	
	user.node.get_tree().root.add_child(hud_inability)
	
	var tween: Tween = user.node.create_tween()
	
	tween.tween_callback(hide_inability).set_delay(1.5)

func hide_inability():
	if hud_inability.get_parent():
		hud_inability.get_parent().remove_child(hud_inability)
	
	end_clear()

func end_script() -> void:
	template_end()

func create_tween() -> Tween:
	if user:
		return user.node.create_tween()
	elif targets.size() == 1:
		return targets[0].node.create_tween()
	else:
		return Engine.get_main_loop().create_tween()
