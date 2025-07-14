class_name CharacterExpTransition
extends Node

var initial_value: CharacterExp
var final_value: CharacterExp
var current_value: float
var is_finished: bool
var exp_diff: int

static func from(initial_level: int, initial_exp: int, plus_exp: int) -> CharacterExpTransition:
	var character_exp_transition: CharacterExpTransition = CharacterExpTransition.new()
	var initial_character_exp = CharacterExp.from(initial_level, initial_exp)
	
	character_exp_transition.set_initial(initial_character_exp)
	character_exp_transition.set_final(initial_character_exp.plus_exp(plus_exp))
	character_exp_transition.exp_diff = plus_exp
	
	return character_exp_transition

func set_initial(value: CharacterExp) -> void:
	initial_value = value.copy()
	current_value = 0

func set_final(value: CharacterExp) -> void:
	final_value = value.copy()

func get_current() -> CharacterExp:
	if is_finished:
		return final_value.copy()
	
	return initial_value.plus_exp(roundi(current_value))

func get_current_leveled_up() -> int:
	return get_current().level - initial_value.level

func get_current_exp_required_for_next_level() -> int:
	return PartyMemberExp.get_exp_required_for_level(get_current().level + 1)

func progress(amount: float) -> void:
	if not is_finished:
		current_value = current_value + amount
		
		if current_value > exp_diff:
			is_finished = true
