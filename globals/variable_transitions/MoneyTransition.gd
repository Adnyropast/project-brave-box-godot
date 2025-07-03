class_name MoneyTransition
extends Node

var initial_value: int
var final_value: int
var current_value: float
var is_finished: bool

static func from(initial_money: int, plus_money: int) -> MoneyTransition:
	var money_transition: MoneyTransition = MoneyTransition.new()
	
	money_transition.set_initial(initial_money)
	money_transition.set_final(initial_money + plus_money)
	
	return money_transition

func set_initial(value: int) -> void:
	initial_value = value
	current_value = value

func set_final(value: int) -> void:
	final_value = value

func get_current_sum() -> int:
	if is_finished:
		return final_value
	
	return roundi(current_value)

func get_current_added() -> int:
	return get_current_sum() - initial_value

func progress(amount: float) -> void:
	if not is_finished:
		current_value = current_value + sign(final_value - initial_value) * amount
		
		if initial_value < final_value && current_value > final_value:
			is_finished = true
			current_value = final_value
		elif initial_value > final_value && current_value < final_value:
			is_finished = true
			current_value = final_value
		elif initial_value == final_value && current_value != final_value:
			is_finished = true
			current_value = final_value
