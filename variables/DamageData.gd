extends Node

class_name DamageData

var damage: int
var type: Types.Damage

func is_physical() -> bool:
	return type == Types.Damage.PHYSICAL or type == Types.Damage.SEVERING or type == Types.Damage.CUTTING or type == Types.Damage.PIERCING or type == Types.Damage.BLASTING or type == Types.Damage.BLUDGEONING
