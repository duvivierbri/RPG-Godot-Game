extends Node2D

var canMove = false

func _ready():
	pass # Replace with function body.

func _process(delta): #right, left, up and down movements without the animation
	var vector = Vector2()
	if canMove == true:
		if Input.is_action_pressed("ui_left"):
			vector.x += -300
		if Input.is_action_pressed("ui_right"):
			vector.x += 300
		if Input.is_action_pressed("ui_up"):
			vector.y += -300
		if Input.is_action_pressed("ui_down"):
			vector.y += 300
