extends GDScript

class_name PassiveScript

var ability: PassiveAbility
var user: PawnComponents
var effect: Node

func on_attach() -> void:
	pass

func on_detach() -> void:
	pass

func get_max_hp_multiplier() -> float:
	return 1

func get_max_mp_multiplier() -> float:
	return 1

func get_p_atk_multiplier() -> float:
	return 1

func get_p_def_multiplier() -> float:
	return 1

func get_m_atk_multiplier() -> float:
	return 1

func get_m_def_multiplier() -> float:
	return 1

func get_spd_multiplier() -> float:
	return 1

func get_aim_multiplier() -> float:
	return 1

func get_eva_multiplier() -> float:
	return 1

func get_crit_multiplier() -> float:
	return 1

func get_res_pwr_multiplier() -> float:
	return 1

func attach_effect(resource: Resource) -> void:
	detach_effect()
	effect = resource.instantiate()
	user.node.add_child(effect)

func detach_effect() -> void:
	if effect:
		user.node.remove_child(effect)
