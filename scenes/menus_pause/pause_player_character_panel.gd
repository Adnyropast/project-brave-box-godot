extends PanelContainer

var party_member: PartyMemberVariables

func set_party_member(_party_member: PartyMemberVariables) -> void:
	party_member = _party_member
	update_name()
	update_level()
	update_hp()
	update_mp()

func update_name() -> void:
	$MarginContainer/VBoxContainer/HBoxContainer/LabelName.text = party_member.party_member.name

func update_level() -> void:
	$MarginContainer/VBoxContainer/HBoxContainer/LabelLevel.text = str(party_member.get_level())

func update_hp() -> void:
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainer/HBoxContainer/LabelHPCurrent.text = str(party_member.current_hp)
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainer/HBoxContainer/LabelHPMax.text = str(party_member.get_max_hp())
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainer/ProgressBarHP.max_value = party_member.get_max_hp()
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainer/ProgressBarHP.value = party_member.current_hp

func update_mp() -> void:
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainer2/HBoxContainer/LabelMPCurrent.text = str(party_member.current_mp)
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainer2/HBoxContainer/LabelMPMax.text = str(party_member.get_max_mp())
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainer2/ProgressBarMP.max_value = party_member.get_max_mp()
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainer2/ProgressBarMP.value = party_member.current_mp
