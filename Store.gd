extends Node2D
var touchingOrange = false
var spokenToOrange = false
var muffinCollected = false
var done = false

func _ready():
	$music.play()
	$OrangeBody/Orange/AnimationTree/AnimationPlayer.set_current_animation("Idle")

func _process(delta):
	walkingCheck()
	
	if Input.is_key_pressed(KEY_Z):
		if touchingOrange == true:
			if spokenToOrange == false:
				done = true
				spokenToOrange = true
				var orange_dialog = Dialogic.start('OrangeDialog')
				add_child(orange_dialog)
				orange_dialog.connect("dialogic_signal", self, 'lastScene')

func lastScene(value):
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

func _on_OrangeArea_area_entered(area):
	touchingOrange = true
	$BlueBody/hint.bbcode_text = "Press Z to talk"

func _on_OrangeArea_area_exited(area):
	touchingOrange = false
	$BlueBody/hint.bbcode_text = ""

func _on_changeSceneFlag_area_entered(area):
	get_tree().change_scene("res://AlmostDone.tscn")
