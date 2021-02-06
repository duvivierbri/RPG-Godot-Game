extends Node2D
var touchingCoffee = false


func _ready():
	var new_dialog = Dialogic.start('Opening')
	add_child(new_dialog)
	$BlueBody/Blue/AnimationTree/AnimationPlayer1.set_current_animation("Idle")
	

func _process(delta):
	walkingCheck()

	if touchingCoffee == true:
		if Input.is_action_just_released("ui_up"):
			touchingCoffee = false
			var coffee_dialog = Dialogic.start('coffeeDialog')
			add_child(coffee_dialog)

func walkingCheck():
	if Input.is_action_pressed("ui_right"):
		$BlueBody/Blue/AnimationTree/AnimationPlayer1.set_current_animation("Walk")
	elif Input.is_action_pressed("ui_left"):
		$BlueBody1/Blue/AnimationTree/AnimationPlayer1.set_current_animation("Walk")
	else:
		$BlueBody/Blue/AnimationTree/AnimationPlayer1.set_current_animation("Idle")

func _on_coffeeArea_area_entered(area):
	$BlueBody1/hint.visible = true
	touchingCoffee = true
	print("You're touching the coffee!")
	$BlueBody1/hint.bbcode_text = "Press up to interact"

func _on_coffeeArea_area_exited(area):
	$BlueBody1/hint.visible = false
	touchingCoffee = false
