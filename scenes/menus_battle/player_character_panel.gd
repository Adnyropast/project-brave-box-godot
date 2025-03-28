extends PanelContainer

var current_hp: int
var current_mp: int
var max_hp: int
var max_mp: int

func set_character_name(name: String):
	$MarginContainer/VBoxContainer/HBoxContainer/LabelName.text = name

func update_progress_bar_hp():
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainerHP/ProgressBar.max_value = max_hp
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainerHP/ProgressBar.value = current_hp

func update_progress_bar_mp():
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainerMP/ProgressBar.max_value = max_mp
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainerMP/ProgressBar.value = current_mp

func set_current_hp(_current_hp: int):
	current_hp = _current_hp
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainerHP/HBoxContainer/LabelHPCurrent.text = str(current_hp)
	update_progress_bar_hp()

func set_current_mp(_current_mp: int):
	current_mp = _current_mp
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainerMP/HBoxContainer/LabelMPCurrent.text = str(current_mp)
	update_progress_bar_mp()

func set_max_hp(_max_hp: int):
	max_hp = _max_hp
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainerHP/HBoxContainer/LabelHPMax.text = str(max_hp)
	update_progress_bar_hp()

func set_max_mp(_max_mp: int):
	max_mp = _max_mp
	$MarginContainer/VBoxContainer/HBoxContainer2/VBoxContainerMP/HBoxContainer/LabelMPMax.text = str(max_mp)
	update_progress_bar_mp()
