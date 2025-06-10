extends PanelContainer

func update_stats_from_party_member(party_member: PartyMemberVariables) -> void:
	update_max_hp(party_member.get_max_hp())
	update_max_mp(party_member.get_max_mp())
	update_p_atk(party_member.get_p_atk())
	update_p_def(party_member.get_p_def())
	update_m_atk(party_member.get_m_atk())
	update_m_def(party_member.get_m_def())
	update_spd(party_member.get_spd())
	update_aim(party_member.get_aim())
	update_eva(party_member.get_eva())
	update_crit(party_member.get_crit())
	update_res_pwr(party_member.get_res_pwr())

func update_stats_from_pawn(pawn: PawnComponents) -> void:
	update_max_hp(pawn.variables.get_max_hp())
	update_max_mp(pawn.variables.get_max_mp())
	update_p_atk(pawn.variables.get_p_atk())
	update_p_def(pawn.variables.get_p_def())
	update_m_atk(pawn.variables.get_m_atk())
	update_m_def(pawn.variables.get_m_def())
	update_spd(pawn.variables.get_speed())
	update_aim(pawn.variables.get_aim())
	update_eva(pawn.variables.get_eva())
	update_crit(pawn.variables.get_crit())
	update_res_pwr(pawn.variables.get_res_pwr())

func update_max_hp(value: int) -> void:
	$MarginContainer/VBoxContainer/HBoxContainer/PanelContainer2/LabelMaxHp.text = str(value)

func update_max_mp(value: int) -> void:
	$MarginContainer/VBoxContainer/HBoxContainer2/PanelContainer2/LabelMaxMp.text = str(value)

func update_p_atk(value: int) -> void:
	$MarginContainer/VBoxContainer/HBoxContainer3/PanelContainer2/LabelPAtk.text = str(value)

func update_p_def(value: int) -> void:
	$MarginContainer/VBoxContainer/HBoxContainer4/PanelContainer2/LabelPDef.text = str(value)

func update_m_atk(value: int) -> void:
	$MarginContainer/VBoxContainer/HBoxContainer5/PanelContainer2/LabelMAtk.text = str(value)

func update_m_def(value: int) -> void:
	$MarginContainer/VBoxContainer/HBoxContainer6/PanelContainer2/LabelMDef.text = str(value)

func update_spd(value: int) -> void:
	$MarginContainer/VBoxContainer/HBoxContainer7/PanelContainer2/LabelSpd.text = str(value)

func update_aim(value: int) -> void:
	$MarginContainer/VBoxContainer/HBoxContainer8/PanelContainer2/LabelAim.text = str(value)

func update_eva(value: int) -> void:
	$MarginContainer/VBoxContainer/HBoxContainer9/PanelContainer2/LabelEva.text = str(value)

func update_crit(value: int) -> void:
	$MarginContainer/VBoxContainer/HBoxContainer10/PanelContainer2/LabelCrit.text = str(value)

func update_res_pwr(value: int) -> void:
	$MarginContainer/VBoxContainer/HBoxContainer11/PanelContainer2/LabelResPwr.text = str(value)
