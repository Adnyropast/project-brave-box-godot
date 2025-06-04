extends Control

var pot_exp: int
var character_panels: Array[Container]

func _ready() -> void:
	update_exp()
	fill_panels()
	var tween = create_tween()
	tween.tween_callback(update_panels).set_delay(1)

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("confirm")):
		close_screen()

func close_screen():
	var tree = get_tree()
	
	tree.change_scene_to_file("res://scenes/map/map_compositia.tscn")
	
	clean_tree_root()

func _on_button_pressed() -> void:
	close_screen()

func clean_tree_root():
	var tree = get_tree()
	
	for child in tree.root.get_children():
		tree.root.remove_child(child)

func update_exp():
	$MarginContainer3/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/LabelEXP.text = str(pot_exp)

func fill_panels():
	for child in $MarginContainer4/PanelContainer/MarginContainer/HBoxContainer.get_children():
		$MarginContainer4/PanelContainer/MarginContainer/HBoxContainer.remove_child(child)
	
	for party_member in PlayerParty.team:
		var panel = preload("res://scenes/victory/victory_character_panel.tscn").instantiate()
		panel.init_from_party_member(party_member)
		panel.update_data()
		
		$MarginContainer4/PanelContainer/MarginContainer/HBoxContainer.add_child(panel)
		
		character_panels.append(panel)

func update_panels():
	for panel in character_panels:
		panel.update_data()
