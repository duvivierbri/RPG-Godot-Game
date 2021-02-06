extends Node2D

var canMove = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
