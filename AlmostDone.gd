extends Node2D

func _ready():
	#Dialog in this game was created with a Godot extention called "Dialogic" which uses .json files to make dialog
	var new_dialog = Dialogic.start('BlueEnding') #Calling the dialog to start
	add_child(new_dialog)
	new_dialog.connect("dialogic_signal", self, 'nextScene') #connecting the signal to the dialog

func nextScene(value): #What happens when the dialog's signal fires off
	get_node("leftBorder/leftCollision").disabled = true #allows the character to go to the next scene

func _process(delta):
	walkingCheck()

func walkingCheck(): #Starts animation when Blue is moving left, right, up or down
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

func _on_changeSceneFlag_area_entered(area): #Changes the scene when the character moves far enough to the right
	get_tree().change_scene("res://FinalScene.tscn")
