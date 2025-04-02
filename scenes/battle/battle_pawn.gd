extends CharacterBody3D

var texture_std: Texture2D
var texture_atk: Texture2D
var texture_hurt: Texture2D
var texture_ko: Texture2D
var tween: Tween
var pawn: PawnComponents

func init_from_party_member(_pawn: PawnComponents, party_member: PartyMember):
	texture_std = party_member.image_std
	texture_atk = party_member.image_atk
	texture_hurt = party_member.image_hurt
	texture_ko = party_member.image_ko
	pawn = _pawn
	return_to_default()

func init_from_enemy(_pawn: PawnComponents, enemy: Enemy):
	texture_std = enemy.image_std
	texture_atk = enemy.image_atk
	texture_hurt = enemy.image_hurt
	pawn = _pawn
	return_to_default()

func return_to_default():
	if pawn.variables.is_ko() && texture_ko:
		$Sprite3D.texture = texture_ko
	else:
		$Sprite3D.texture = texture_std

func start_attack():
	$Sprite3D.texture = texture_atk
	
	if tween:
		tween.stop()
	
	tween = create_tween()
	tween.tween_callback(stop_attack).set_delay(1)

func stop_attack():
	return_to_default()

func start_hurt():
	$Sprite3D.texture = texture_hurt
	
	if tween:
		tween.stop()
	
	tween = create_tween()
	tween.tween_callback(stop_hurt).set_delay(1)

func stop_hurt():
	return_to_default()
