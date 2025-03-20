extends CharacterBody2D

func get_input_direction():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	
	return input_direction

func move_2d(direction: Vector2):
	velocity = velocity + direction

func brake_2d(friction: float):
	velocity /= friction

func _process(_delta: float) -> void:
	const speed = 120
	const friction = 1.375
	
	var input_direction = get_input_direction()
	
	move_2d(input_direction * speed)
	brake_2d(friction)
	move_and_slide()
