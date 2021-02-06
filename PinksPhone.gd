#This code is for Pink's Minigame, AKA Quest 2 :) There are 3 levels that the player has to beat to win! The goal of
#the minigame is to get to the monster's girlfriend/princess (the monstress) on the other side.
#Each level has a different ball movement, making the game easier or harder. 
extends Sprite

signal GameComplete
var challenge = 1 #keeps track of the level the player is currently on

func _ready(): #ensures the monster starts at it's starting spot when the game first opens.
	goToStartPosition()

func _process(delta): #Ensures the game is only active when the player can see it
	if self.visible == true:
		startPinksGame()
	
func startPinksGame(): #This is the code that starts the minigame and changes levels when needed
	#Challenge 1, 2, and 3 are the different animations the ball goes through with each level!
	if challenge == 1:
		$ball/ballArea/BallAnimationTree/BallAnimation.set_current_animation("Challenge1")
	elif challenge == 2:
		$ball/ballArea/BallAnimationTree/BallAnimation.set_current_animation("Challenge2")
	elif challenge == 3:
		$ball/ballArea/BallAnimationTree/BallAnimation.set_current_animation("Challenge3")
	elif challenge == 4:
		self.visible = false
		emit_signal("GameComplete") #A signal is emitted when the game is complete

func _on_Area2D_area_entered(area): #This is the code for when the monster gets to the princess monsteress
	challenge = challenge + 1
	print("Touched!!!!!!!")
	goToStartPosition()
	$yay.play()

func goToStartPosition(): #Sends the monster to the start position
	$MonsterBody.position.x = 0
	$MonsterBody.position.y = 0
	pass


func _on_ballArea_area_entered(area): #This is for when the monster hits the obsticle (the ball)
	goToStartPosition() #When the monster hits the ball, he gets sent to the start position
	if self.visible == true:
		$ouch.play()
