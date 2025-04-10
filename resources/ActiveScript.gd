extends GDScript

class_name ActiveScript

var ability: ActiveAbility
var user: PawnComponents
var targets: Array[PawnComponents]
var hud: Control
var hud_inability: Control

func start():
	pass

func template_start():
	redirect_targets()
	show_hud()
	
	if user.variables.mp >= ability.mp_cost:
		BattleCosts.expend_mp(user, ability.mp_cost)
		start()
	else:
		show_inability()
	
	template_end()

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
	var tween: Tween = user.node.create_tween()
	
	tween.tween_callback(end_clear).set_delay(1)

func end_clear():
	hide_hud()
	user.end_action()

func show_hud():
	hud = preload("res://scenes/menus_battle/hud_active_ability.tscn").instantiate()
	
	hud.set_label(ability.name)
	
	user.node.get_tree().root.add_child(hud)

func hide_hud():
	if hud.get_parent():
		hud.get_parent().remove_child(hud)

func show_inability():
	hud_inability = preload("res://scenes/menus_battle/hud_inability.tscn").instantiate()
	
	user.node.get_tree().root.add_child(hud_inability)
	
	var tween: Tween = user.node.create_tween()
	
	tween.tween_callback(hide_inability).set_delay(1)

func hide_inability():
	if hud_inability.get_parent():
		hud_inability.get_parent().remove_child(hud_inability)
