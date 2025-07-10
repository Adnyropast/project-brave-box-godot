extends Control

var pot_exp: int
var pot_money: int
var character_panels: Array[Container]
var player_pawns: Array[PawnComponents]
var money_transition: MoneyTransition

func _init() -> void:
	FocusButtons.set_focus_on_draw(self)

func _ready() -> void:
	money_transition = MoneyTransition.from(PlayerParty.money, pot_money)
	
	update_exp()
	update_money()
	fill_panels()
	pose_player_pawns()

func _process(delta: float) -> void:
	money_transition.progress(delta * pot_money / 6)
	
	update_player_money()

func close_screen():
	BattleSceneExit.exit_battle()

func _on_button_pressed() -> void:
	close_screen()

func update_exp():
	$MarginContainer3/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/LabelEXP.text = str(pot_exp)

func update_money():
	$MarginContainer3/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer2/LabelMoney.text = str(pot_money)

func fill_panels():
	for child in $MarginContainer4/PanelContainer/MarginContainer/HBoxContainer.get_children():
		$MarginContainer4/PanelContainer/MarginContainer/HBoxContainer.remove_child(child)
	
	for party_member in PlayerParty.team:
		var panel = preload("res://scenes/victory/victory_character_panel.tscn").instantiate()
		panel.init_from_party_member(party_member, pot_exp)
		panel.update_data()
		
		$MarginContainer4/PanelContainer/MarginContainer/HBoxContainer.add_child(panel)
		
		character_panels.append(panel)

func update_player_money():
	$MarginContainer5/PanelContainer/MarginContainer/HBoxContainer/LabelChrs.text = str(money_transition.get_current_sum())
	$MarginContainer5/PanelContainer/MarginContainer/HBoxContainer/LabelChrs/Control/LabelChrsGain.text = "+" + str(money_transition.get_current_added())
	$MarginContainer5/PanelContainer/MarginContainer/HBoxContainer/LabelChrs/Control/LabelChrsGain.show()

func pose_player_pawns() -> void:
	for pawn in player_pawns:
		pawn.node.start_victory()
