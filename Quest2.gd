#This code is for level 2 of the game where the player needs to complete a minigame for another character

extends Node2D
var touchingPink = false #checks if character is touching Pinks character
var spokenToPink = false #checks if character has spoken to Pink
var missionComplete = false #check if the player completed the mission

func _ready(): #scene setup
	$PlayWithMe.playing = true #plays background music
	disablePhone()
	$PinksPhone.visible = false #hides the game console emulator
	$PinkBody/Blue/AnimationTree/AnimationPlayer.set_current_animation("Idle") #sets Pink character animation
	var new_dialog = Dialogic.start('Quest2Setup') #starts dialog
	add_child(new_dialog)

func _process(delta):
	walkingCheck()

	if touchingPink == true: #first time talking to Pink
		if Input.is_key_pressed(KEY_Z):
			touchingPink = false
			if spokenToPink == false:
				var pink_dialog = Dialogic.start('PinksProblem')
				add_child(pink_dialog)
				pink_dialog.connect("dialogic_signal", self, 'gameStart') #gameStart signal tells the script Pink gave instructions on how to play
				spokenToPink = true
	
	if $PinksPhone.visible == true:
		$BlueBody.visible = false
		$PinkBody.visible = false
		enablePhone()
		disableCharacters()
	elif $PinksPhone.visible == false:
		disablePhone()
		enableCharacters()
		$BlueBody.visible = true
		$PinkBody.visible = true

func gameStart(value): #starts the minigame
	$PinksPhone.visible = true

func walkingCheck(): #plays walking animation when moving
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

func _on_pinkArea_area_entered(area): #checks if character is touching Pink and can talk to her
	$BlueBody/hint.visible = true
	touchingPink = true
	$BlueBody/hint.bbcode_text = "Press Z to interact"

func _on_pinkArea_area_exited(area): #checks if character ISNT touching Pink
	$BlueBody/hint.visible = false
	touchingPink = false

func _on_PinksPhone_GameComplete(): #checks if the minigame is completed
	missionComplete = true
	var pinkResolution = Dialogic.start('PinksResolution')
	add_child(pinkResolution)
	pinkResolution.connect("dialogic_signal", self, 'nextScene')

func nextScene(value):
	get_node("rightLimit/rightLimitShape").disabled = true

func disablePhone(): #Disables the minigame so it doesnt effect the scene
	get_node("PinksPhone/PinksScreen/PhoneScreenBoarder1").disabled= true
	get_node("PinksPhone/PinksScreen/PhoneScreenBoarder2").disabled= true
	get_node("PinksPhone/PinksScreen/PhoneScreenBoarder3").disabled= true
	get_node("PinksPhone/PinksScreen/PhoneScreenBoarder4").disabled= true
	get_node("PinksPhone/MonsterBody/MonsterCollision").disabled = true
	get_node("PinksPhone/Monstress/Area2D/monstressArea").disabled = true

func enablePhone(): #enables the minigame so player can play it
	get_node("PinksPhone/PinksScreen/PhoneScreenBoarder1").disabled= false
	get_node("PinksPhone/PinksScreen/PhoneScreenBoarder2").disabled= false
	get_node("PinksPhone/PinksScreen/PhoneScreenBoarder3").disabled= false
	get_node("PinksPhone/PinksScreen/PhoneScreenBoarder4").disabled= false
	get_node("PinksPhone/MonsterBody/MonsterCollision").disabled = false
	get_node("PinksPhone/Monstress/Area2D/monstressArea").disabled = false
	
func disableCharacters(): #Disables the characters so they cannot effect the scene
	get_node("BlueBody/CollisionShape2D").disabled = true
	get_node("BlueBody/blueArea/CollisionShape2D2").disabled = true
	get_node("PinkBody/pinkArea/CollisionShape2D2").disabled = true

func enableCharacters(): #Enables the characters on the scene so player can interact with them
	get_node("BlueBody/CollisionShape2D").disabled = false
	get_node("BlueBody/blueArea/CollisionShape2D2").disabled = false
	get_node("PinkBody/pinkArea/CollisionShape2D2").disabled = false

func _on_changeScene_area_entered(area): #changes the scene
	get_tree().change_scene("res://Store.tscn")
