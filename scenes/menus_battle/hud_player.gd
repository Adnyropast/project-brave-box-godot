extends Control

var pawns_player: Array[PawnComponents]

func init_players(_pawns_player: Array[PawnComponents]):
	pawns_player = _pawns_player

func fill_panels():
	for pawn in pawns_player:
		var panel = pawn.player_panel
		
		$MarginContainer/VBoxContainer.add_child(panel)

func _ready() -> void:
	fill_panels()
