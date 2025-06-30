extends CharacterBody3D

var texture_std: Texture2D
var texture_atk: Texture2D
var texture_def: Texture2D
var texture_cast: Texture2D
var texture_hurt: Texture2D
var texture_ko: Texture2D
var tween: Tween
var pawn: PawnComponents

func init_from_party_member(_pawn: PawnComponents, party_member: PartyMember):
	$AnimationPlayer.autoplay = "start_slide_player"
	texture_std = party_member.sprite_set.image_std
	texture_atk = party_member.sprite_set.image_atk
	texture_def = party_member.sprite_set.image_def
	texture_cast = party_member.sprite_set.image_cast
	texture_hurt = party_member.sprite_set.image_hurt
	texture_ko = party_member.sprite_set.image_ko
	pawn = _pawn
	return_to_default()

func init_from_enemy(_pawn: PawnComponents, enemy: Enemy):
	$AnimationPlayer.autoplay = "start_slide_enemy"
	texture_std = enemy.sprite_set.image_std
	texture_atk = enemy.sprite_set.image_atk
	texture_def = enemy.sprite_set.image_def
	texture_cast = enemy.sprite_set.image_cast
	texture_hurt = enemy.sprite_set.image_hurt
	pawn = _pawn
	return_to_default()

func return_to_default():
	tween = null
	
	if pawn.variables.is_ko() && texture_ko:
		$ShakeNode/Sprite3D.texture = texture_ko
	elif pawn.variables.state_defend:
		$ShakeNode/Sprite3D.texture = texture_def
	else:
		$ShakeNode/Sprite3D.texture = texture_std

func start_attack():
	$ShakeNode/Sprite3D.texture = texture_atk
	
	if tween:
		tween.stop()
	
	tween = create_tween()
	tween.tween_callback(stop_attack).set_delay(1)

func stop_attack():
	return_to_default()

func start_hurt():
	$ShakeNode/Sprite3D.texture = texture_hurt
	
	if tween:
		tween.stop()
	
	tween = create_tween()
	tween.tween_callback(stop_hurt).set_delay(1)

func stop_hurt():
	return_to_default()

func start_cast():
	$ShakeNode/Sprite3D.texture = texture_cast
	
	if tween:
		tween.stop()
	
	tween = create_tween()
	tween.tween_callback(return_to_default).set_delay(1)

func return_to_default_not_busy():
	if not tween:
		return_to_default()

func hide_sprite() -> void:
	$ShakeNode/Sprite3D.hide()

func get_shake_node() -> Node3D:
	return $ShakeNode
