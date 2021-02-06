extends Node2D
var beginning = true
var beeClick = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var new_dialog = Dialogic.start('BlueIsUpset')
	add_child(new_dialog)
	new_dialog.connect("dialogic_signal", self, 'nextScene')

func nextScene(value):
	get_node("rightBorder/rightCollision").disabled = true
	
func _process(delta):
	walkingCheck();

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
	get_tree().change_scene("res://Quest1.tscn")

func _on_beeButton_button_up():
	if beeClick == false:
		beeClick = true
		var bees = Dialogic.start('loveBees')
		add_child(bees)
