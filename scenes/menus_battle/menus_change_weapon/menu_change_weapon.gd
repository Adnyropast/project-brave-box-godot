extends Control

var menu_cancel: Control
var pawn: PawnComponents

func _init() -> void:
	FocusButtons.set_focus_on_draw(self)

func _ready() -> void:
	update_current_weapon()
	fill_weapon_options()

func _on_button_remove_pressed() -> void:
	set_weapon(null)

func _on_button_cancel_pressed() -> void:
	Menus.switch_menus(self, menu_cancel)

func update_current_weapon() -> void:
	var weapon_name
	
	if pawn.variables.party_member.weapon:
		weapon_name = pawn.variables.party_member.weapon.name
	else:
		weapon_name = "None"
	
	$MarginContainer/VBoxContainer/PanelContainer/MarginContainer/HBoxContainer/LabelCurrent.text = weapon_name

func fill_weapon_options() -> void:
	var container = $MarginContainer/VBoxContainer/VBoxContainer
	
	for child in container.get_children():
		container.remove_child(child)
	
	for iv in PlayerInventory.weapons:
		var option = preload("res://scenes/menus_battle/menus_change_weapon/button_change_weapon_option.tscn").instantiate()
		
		option.menu_change_weapon = self
		option.set_item_variables(iv)
		
		container.add_child(option)

func set_weapon(weapon: Weapon) -> void:
	PartyMemberEquipment.equip_weapon(pawn.variables.party_member, weapon)
	pawn.player_panel.set_max_hp(pawn.variables.get_max_hp())
	pawn.player_panel.set_max_mp(pawn.variables.get_max_mp())
	update_current_weapon()
	fill_weapon_options()
	FocusButtons.focus_first_child(self)
