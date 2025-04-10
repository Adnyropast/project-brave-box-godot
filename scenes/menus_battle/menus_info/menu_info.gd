extends Control

var battle: Node
var pawns: Array[PawnComponents]

func _ready() -> void:
	fill_buttons()
	update_info(pawns[0])

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("cancel"):
		close_menu()

func _on_button_close_pressed() -> void:
	close_menu()

func close_menu():
	get_tree().paused = false
	Menus.close_menu(self)
	battle.show_ui()

func fill_buttons():
	for pawn in pawns:
		var button = preload("res://scenes/menus_battle/menus_info/button_character_info.tscn").instantiate()
		
		button.text = pawn.variables.name_alias
		button.menu_info = self
		button.pawn = pawn
		
		$MarginContainer/VBoxContainer/VBoxContainer.add_child(button)

func update_info(pawn: PawnComponents):
	update_name(pawn.variables.name_alias)
	update_hp(pawn.variables.hp, pawn.variables.get_max_hp())
	update_mp(pawn.variables.mp, pawn.variables.get_max_mp())
	update_stats(pawn)

func update_name(_name: String):
	$MarginContainer3/PanelContainer/MarginContainer/LabelName.text = _name

func update_hp(hp: int, max_hp: int):
	$MarginContainer4/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/LabelHPCurrent.text = str(hp)
	$MarginContainer4/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer/LabelHPMax.text = str(max_hp)
	$MarginContainer4/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/ProgressBarHP.max_value = max_hp
	$MarginContainer4/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/ProgressBarHP.value = hp

func update_mp(mp: int, max_mp: int):
	$MarginContainer4/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer2/HBoxContainer/LabelMPCurrent.text = str(mp)
	$MarginContainer4/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer2/HBoxContainer/LabelMPMax.text = str(max_mp)
	$MarginContainer4/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer2/ProgressBarMP.max_value = max_mp
	$MarginContainer4/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer2/ProgressBarMP.value = mp

func update_stats(pawn: PawnComponents):
	update_maximum_hp(pawn.variables.get_max_hp())
	update_maximum_mp(pawn.variables.get_max_mp())
	update_physical_attack(pawn.variables.get_p_atk())
	update_physical_defense(pawn.variables.get_p_def())
	update_magical_attack(pawn.variables.get_m_atk())
	update_magical_defense(pawn.variables.get_m_def())
	update_speed(pawn.variables.get_speed())
	update_aim(pawn.variables.get_aim())
	update_evasion(pawn.variables.get_eva())
	update_critical_chance(pawn.variables.get_crit())
	update_restorative_power(pawn.variables.get_res_pwr())

func update_maximum_hp(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/PanelContainer2/Label.text = str(value)

func update_maximum_mp(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer2/PanelContainer2/Label.text = str(value)

func update_physical_attack(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer3/PanelContainer2/Label.text = str(value)

func update_physical_defense(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer4/PanelContainer2/Label.text = str(value)

func update_magical_attack(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer5/PanelContainer2/Label.text = str(value)

func update_magical_defense(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer6/PanelContainer2/Label.text = str(value)

func update_speed(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer7/PanelContainer2/Label.text = str(value)

func update_aim(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer8/PanelContainer2/Label.text = str(value)

func update_evasion(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer9/PanelContainer2/Label.text = str(value)

func update_critical_chance(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer10/PanelContainer2/Label.text = str(value)

func update_restorative_power(value: int):
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer11/PanelContainer2/Label.text = str(value)
