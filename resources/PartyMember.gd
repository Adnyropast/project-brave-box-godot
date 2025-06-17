extends Resource

class_name PartyMember

enum StatRank {S, A, B, C}

@export var name: String
@export var image_std: Texture
@export var image_atk: Texture
@export var image_def: Texture
@export var image_cast: Texture
@export var image_hurt: Texture
@export var image_low: Texture
@export var image_ko: Texture
@export var image_victory: Texture
@export var max_hp: StatRank
@export var max_mp: StatRank
@export var p_atk: StatRank
@export var p_def: StatRank
@export var m_atk: StatRank
@export var m_def: StatRank
@export var spd: StatRank
@export var aim: StatRank
@export var eva: StatRank
@export var crit: StatRank
@export var res_pwr: StatRank
@export var initial_weapon: Weapon
@export var initial_headgear: Headgear
@export var initial_body_armor: BodyArmor
@export var initial_accessory: Accessory
@export var initial_ability_set: AbilitySet

static func get_rank_multiplier(rank: StatRank):
	if rank == StatRank.S:
		return 1.3
	
	if rank == StatRank.A:
		return 1.2
	
	if rank == StatRank.B:
		return 1.1
	
	if rank == StatRank.C:
		return 1.0
	
	return 1.0

func multiply_max_hp(value: int):
	return value * get_rank_multiplier(max_hp)

func multiply_max_mp(value: int):
	return value * get_rank_multiplier(max_mp)

func multiply_p_atk(value: int):
	return value * get_rank_multiplier(p_atk)

func multiply_p_def(value: int):
	return value * get_rank_multiplier(p_def)

func multiply_m_atk(value: int):
	return value * get_rank_multiplier(m_atk)

func multiply_m_def(value: int):
	return value * get_rank_multiplier(m_def)

func multiply_spd(value: int):
	return value * get_rank_multiplier(spd)

func multiply_aim(value: int):
	return value * get_rank_multiplier(aim)

func multiply_eva(value: int):
	return value * get_rank_multiplier(eva)

func multiply_crit(value: int):
	return value * get_rank_multiplier(crit)

func multiply_res_pwr(value: int):
	return value * get_rank_multiplier(res_pwr)
