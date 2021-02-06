extends Node2D
var touchingOrange = false
var spokenToOrange = false
var muffinCollected = false
var done = false

func _ready(): #When scene starts...
	$music.play() #background music
	$OrangeBody/Orange/AnimationTree/AnimationPlayer.set_current_animation("Idle") #plays idle animation for Orange character

func _process(delta):
	walkingCheck()
	 #Allows player to speak to orange character when they press Z
	if Input.is_key_pressed(KEY_Z):
		if touchingOrange == true:
			if spokenToOrange == false:
				done = true
				spokenToOrange = true
				var orange_dialog = Dialogic.start('OrangeDialog')
				add_child(orange_dialog)
				orange_dialog.connect("dialogic_signal", self, 'lastScene') #When the dialog ends

func lastScene(value): #What happens when dialog signal emits 
	get_node("leftLimit/leftLimitShape").disabled = true

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

func _on_OrangeArea_area_entered(area): #prompts player to talk to orange character when they are close enough to them
	touchingOrange = true
	$BlueBody/hint.bbcode_text = "Press Z to talk"

func _on_OrangeArea_area_exited(area): #checks if player isn't touching orange
	touchingOrange = false
	$BlueBody/hint.bbcode_text = ""

func _on_changeSceneFlag_area_entered(area): #Changes scenes when player moves far enough to the left
	get_tree().change_scene("res://AlmostDone.tscn")
