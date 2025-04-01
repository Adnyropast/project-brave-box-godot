extends CharacterBody3D

var texture_std: Texture2D
var texture_atk: Texture2D
var texture_hurt: Texture2D
var tween: Tween

func init_from_party_member(party_member: PartyMember):
	texture_std = party_member.image_std
	texture_atk = party_member.image_atk
	texture_hurt = party_member.image_hurt
	$Sprite3D.texture = texture_std

func init_from_enemy(enemy: Enemy):
	texture_std = enemy.image_std
	texture_atk = enemy.image_atk
	texture_hurt = enemy.image_hurt
	$Sprite3D.texture = texture_std

func start_attack():
	$Sprite3D.texture = texture_atk
	
	if tween:
		tween.stop()
	
	tween = create_tween()
	tween.tween_callback(stop_attack).set_delay(1)

func stop_attack():
	$Sprite3D.texture = texture_std

func start_hurt():
	$Sprite3D.texture = texture_hurt
	
	if tween:
		tween.stop()
	
	tween = create_tween()
	tween.tween_callback(stop_hurt).set_delay(1)

func stop_hurt():
	$Sprite3D.texture = texture_std
