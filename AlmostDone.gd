extends Node2D

func _ready():
	var new_dialog = Dialogic.start('BlueEnding')
	add_child(new_dialog)
	new_dialog.connect("dialogic_signal", self, 'nextScene')

func nextScene(value):
	get_node("leftBorder/leftCollision").disabled = true

func _process(delta):
	walkingCheck()

func walkingCheck():
	if Input.is_action_pressed("ui_right"):
		$BlueBody/Blue/AnimationTree/AnimationPlayer.set_current_animation("Walk")
	elif Input.is_action_pressed("ui_left"):
		$BlueBody/Blue/AnimationTree/AnimationPlayer.set_current_animation("Walk")
	elif Input.is_action_pressed("ui_up"):
		$BlueBody/Blue/AnimationTree/AnimationPlayer.set_current_animation("Walk")
	elif Input.is_action_pressed("ui_down"):
		$BlueBody/Blue/AnimationTree/AnimationPlayer.set_current_animation("Walk")
	else:
		$BlueBody/Blue/AnimationTree/AnimationPlayer.set_current_animation("Idle")

func _on_changeSceneFlag_area_entered(area):
	get_tree().change_scene("res://FinalScene.tscn")
