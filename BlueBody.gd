extends KinematicBody2D

func _process(delta):
	var vector = Vector2()
	if Input.is_action_pressed("ui_left"):
		vector.x += -9000
	elif Input.is_action_pressed("ui_right"):
		vector.x += 9000
	elif Input.is_action_pressed("ui_up"):
		vector.y += -9000
	elif Input.is_action_pressed("ui_down"):
		vector.y += 9000
		
	move_and_slide(vector*delta)
