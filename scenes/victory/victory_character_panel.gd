extends PanelContainer

var party_member: PartyMemberVariables
var exp_transition: CharacterExpTransition
var pot_exp: int

func _process(delta: float) -> void:
	exp_transition.progress(delta * pot_exp / 6)
	update_data()

func init_from_party_member(_party_member: PartyMemberVariables, _pot_exp: int):
	party_member = _party_member
	pot_exp = _pot_exp
	exp_transition = CharacterExpTransition.from(
		party_member.get_level(),
		party_member.get_current_exp(),
		pot_exp,
	)
	
	update_data()

func update_data():
	update_name()
	update_level()
	update_exp()
	update_levels_gained()

func update_name():
	$MarginContainer/VBoxContainer/HBoxContainer/LabelName.text = party_member.party_member.name

func update_level():
	$MarginContainer/VBoxContainer/HBoxContainer/LabelLevel.text = str(exp_transition.get_current().level)

func update_exp():
	var current_exp = exp_transition.get_current().current_exp
	var exp_for_next_level = exp_transition.get_current_exp_required_for_next_level()
	
	$MarginContainer/VBoxContainer/HBoxContainer2/LabelEXPCurrent.text = str(current_exp)
	$MarginContainer/VBoxContainer/HBoxContainer2/LabelEXPNext.text = str(exp_for_next_level)
	$MarginContainer/VBoxContainer/ProgressBarEXP.max_value = exp_for_next_level
	$MarginContainer/VBoxContainer/ProgressBarEXP.value = current_exp

func update_levels_gained():
	var level_diff = exp_transition.get_current_leveled_up()
	
	if level_diff > 0:
		$Control/LabelLvGain.text = "+" + str(level_diff)
		$Control.show()
	else:
		$Control.hide()
