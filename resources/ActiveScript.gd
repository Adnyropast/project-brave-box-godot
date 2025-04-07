extends GDScript

class_name ActiveScript

var ability: ActiveAbility
var user: PawnComponents
var targets: Array[PawnComponents]
var hud: Control

func start():
	pass

func template_start():
	show_hud()
	start()
	template_end()

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
