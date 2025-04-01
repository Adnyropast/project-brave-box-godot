extends ActiveScript

func start():
	for target in targets:
		var target_screen = preload("res://scenes/battle/target_screen.tscn").instantiate()
		
		target.node.add_child(target_screen)
