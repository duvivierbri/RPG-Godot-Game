extends Node2D
var touchingYellow = false

func _ready():
	$Music.play()
	var celebrate = Dialogic.start("Celebration")
	add_child(celebrate)

func _process(delta):
	walkingCheck()
	talkToYellowCheck()

func talkToYellowCheck():
	if Input.is_key_pressed(KEY_Z):
		if touchingYellow == true:
			var celebrate2 = Dialogic.start("FINALDIALOG")
			add_child(celebrate2)
			celebrate2.connect("dialogic_signal", self, 'THEEND')

func THEEND(value):
	get_tree().change_scene("res://END.tscn")

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

func _on_yellowArea_area_entered(area):
	touchingYellow = true
	$BlueBody/hint.bbcode_text = "Speak to Yellow"

func _on_yellowArea_area_exited(area):
	touchingYellow = false
	$BlueBody/hint.bbcode_text = ""
