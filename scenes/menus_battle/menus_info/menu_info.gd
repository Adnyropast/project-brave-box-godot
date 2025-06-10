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
	$MarginContainer2/StatsPanel.update_stats_from_pawn(pawn)
