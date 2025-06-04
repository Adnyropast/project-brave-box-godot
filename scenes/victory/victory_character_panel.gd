extends PanelContainer

var party_member: PartyMemberVariables
var initial_exp: int
var initial_level: int
var final_exp: int
var final_level: int

func init_from_party_member(_party_member: PartyMemberVariables):
	party_member = _party_member
	#initial_exp = party_member.experience
	initial_level = party_member.get_level()
	
	update_data()

func update_data():
	update_name()
	update_level()
	update_exp()
	update_levels_gained()
	
	#var tween = create_tween()
	#tween.tween_property($MarginContainer/VBoxContainer/ProgressBarEXP, "value", )
	#tween.set_ease(Tween.EASE_IN)

func update_name():
	$MarginContainer/VBoxContainer/HBoxContainer/LabelName.text = party_member.party_member.name

func update_level():
	$MarginContainer/VBoxContainer/HBoxContainer/LabelLevel.text = str(party_member.get_level())

func update_exp():
	$MarginContainer/VBoxContainer/HBoxContainer2/LabelEXPCurrent.text = str(party_member.get_current_exp())
	$MarginContainer/VBoxContainer/HBoxContainer2/LabelEXPNext.text = str(party_member.get_exp_for_next_level())
	$MarginContainer/VBoxContainer/ProgressBarEXP.max_value = party_member.get_exp_for_next_level()
	$MarginContainer/VBoxContainer/ProgressBarEXP.value = party_member.get_current_exp()

func update_levels_gained():
	var level_diff = party_member.get_level() - initial_level
	
	if level_diff > 0:
		$Control/LabelLvGain.text = "+" + str(level_diff)
		$Control.show()
	else:
		$Control.hide()
