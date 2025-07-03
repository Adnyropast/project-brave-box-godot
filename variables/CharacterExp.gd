class_name CharacterExp
extends Node

var level: int
var current_exp: int

static func from(_level: int, _current_exp: int) -> CharacterExp:
	var res: CharacterExp = CharacterExp.new()
	
	res.level = _level
	res.current_exp = _current_exp
	
	return res

func copy() -> CharacterExp:
	var res: CharacterExp = CharacterExp.new()
	
	res.level = level
	res.current_exp = current_exp
	
	return res

func plus_exp(amount: int) -> CharacterExp:
	var res: CharacterExp = CharacterExp.new()
	res.level = level
	res.current_exp = current_exp
	
	res.current_exp = res.current_exp + amount
	var exp_required_next = PartyMemberExp.get_exp_required_for_level(res.level + 1)
	
	while res.current_exp >= exp_required_next:
		res.current_exp = res.current_exp - exp_required_next
		res.level = res.level + 1
		exp_required_next = PartyMemberExp.get_exp_required_for_level(res.level + 1)
	
	return res
