extends Node2D
var touchingCoffee = false
var nearCoffee = false
var canGetCoin = false

func _ready():
	$Music.play()
	var new_dialog = Dialogic.start('Opening')
	add_child(new_dialog)
	$BlueBody/hint.visible = false

func _process(delta):
	walkingCheck()

	if touchingCoffee == true:
		if Input.is_key_pressed(KEY_Z):
			touchingCoffee = false
			var coffee_dialog = Dialogic.start('coffeeDialog')
			add_child(coffee_dialog)
			coffee_dialog.connect("dialogic_signal", self, 'allowCoin')



func allowCoin(value):
	canGetCoin = true

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

func _on_CoffeeArea_area_entered(area):
	$BlueBody/hint.visible = true
	touchingCoffee = true
	$BlueBody/hint.bbcode_text = "Press Z to interact"

func _on_CoffeeArea_area_exited(area):
	$BlueBody/hint.visible = false
	touchingCoffee = false

func _on_changeSceneFlag_area_entered(area):
	get_tree().change_scene("res://Scene2.tscn")

func _on_PiggyBank_pressed():
	if canGetCoin == true:
		$PiggyBank.hide()

func _on_Coin_pressed():
	if canGetCoin == true:
		$PickUp.play()
		$Coin.hide()
		var tutorialEnd = Dialogic.start('timeToGo')
		add_child(tutorialEnd)
		tutorialEnd.connect("dialogic_signal", self, 'tutorialComplete')

func tutorialComplete(value):
	get_node("rightBorder/rightCollision").disabled = true
