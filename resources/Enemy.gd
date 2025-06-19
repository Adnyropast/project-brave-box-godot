extends Resource

class_name Enemy

@export var name: String
@export var sprite_set: SpriteSet
@export var ability_set: AbilitySet
@export var resist_severing: int
@export var resist_cutting: int
@export var resist_piercing: int
@export var resist_blasting: int
@export var resist_bludgeoning: int
@export var resist_fire: int
@export var resist_water: int
@export var resist_lightning: int
@export var resist_earth: int
@export var resist_wind: int
@export var resist_light: int
@export var resist_dark: int

static func convert_resist_multiplier(resist: int) -> float:
	return 1 - 0.5 * resist

func get_type_multiplier(type: Types.Damage) -> float:
	if type == Types.Damage.SEVERING:
		return convert_resist_multiplier(resist_severing)
	elif type == Types.Damage.CUTTING:
		return convert_resist_multiplier(resist_cutting)
	elif type == Types.Damage.PIERCING:
		return convert_resist_multiplier(resist_piercing)
	elif type == Types.Damage.BLASTING:
		return convert_resist_multiplier(resist_blasting)
	elif type == Types.Damage.BLUDGEONING:
		return convert_resist_multiplier(resist_bludgeoning)
	elif type == Types.Damage.FIRE:
		return convert_resist_multiplier(resist_fire)
	elif type == Types.Damage.WATER:
		return convert_resist_multiplier(resist_water)
	elif type == Types.Damage.LIGHTNING:
		return convert_resist_multiplier(resist_lightning)
	elif type == Types.Damage.EARTH:
		return convert_resist_multiplier(resist_earth)
	elif type == Types.Damage.WIND:
		return convert_resist_multiplier(resist_wind)
	elif type == Types.Damage.LIGHT:
		return convert_resist_multiplier(resist_light)
	elif type == Types.Damage.DARK:
		return convert_resist_multiplier(resist_dark)
	
	return 1
