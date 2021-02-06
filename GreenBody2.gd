extends KinematicBody2D

func _ready():
	self.visible = true
	$Green/AnimationTree/AnimationPlayer.set_current_animation("Idle")
