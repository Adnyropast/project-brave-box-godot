extends Area2D

@export var sprite: Texture2D
@export var point_of_interest: PointOfInterest
var hud_node: Node

func _ready() -> void:
	init_sprite_texture()
	update_mark_new()

func _on_body_entered(_body: Node2D) -> void:
	if point_of_interest.has_menus():
		show_hud()

func _on_body_exited(_body: Node2D) -> void:
	hide_hud()

func init_sprite_texture():
	get_node("Sprite2D").texture = sprite

func show_hud():
	hud_node = preload("res://scenes/menus/hud_poi.tscn").instantiate()
	hud_node.point_of_interest = point_of_interest
	
	get_tree().root.add_child(hud_node)

func hide_hud():
	if hud_node:
		hud_node.queue_free()

func update_mark_new():
	if PlayerMissions.poi_has_new_missions(point_of_interest):
		$MarkNew.show()
	else:
		$MarkNew.hide()
