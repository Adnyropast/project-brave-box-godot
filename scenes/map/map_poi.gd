extends Area2D

@export var sprite: Texture2D
@export var point_of_interest: PointOfInterest
var hud_node: Node
var hud_node_parent: Node

func init_sprite_texture():
	get_node("Sprite2D").texture = sprite

func init_hud_node():
	hud_node_parent = get_tree().root
	hud_node = preload("res://scenes/menus/hud_poi.tscn").instantiate()
	hud_node.point_of_interest = point_of_interest

func _ready() -> void:
	init_sprite_texture()
	init_hud_node()

func show_hud():
	hud_node_parent.add_child(hud_node)

func hide_hud():
	if(hud_node.get_parent() == hud_node_parent):
		hud_node_parent.remove_child(hud_node)

func _on_body_entered(_body: Node2D) -> void:
	show_hud()
	
	pass # Replace with function body.

func _on_body_exited(_body: Node2D) -> void:
	hide_hud()
	
	pass # Replace with function body.
