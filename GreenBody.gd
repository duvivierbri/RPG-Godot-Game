extends KinematicBody2D

func _ready():
	self.visible = false
	$Green/AnimationTree/AnimationPlayer.set_current_animation("Idle")
