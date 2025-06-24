extends ActiveScript

class_name UseItemActiveScript

var tween: Tween

func start():
	tween = create_tween()
	tween.tween_interval(3.0/60)
	tween.tween_callback(user.node.start_cast)
	tween.tween_interval(1.0/60)
	
	effect_body()
	
	tween.tween_callback(end_script)

func effect_body() -> void:
	pass
