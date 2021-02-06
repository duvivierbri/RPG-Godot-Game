extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$chocolate.play()

func _on_PlayAgain_button_up():
	get_tree().change_scene("res://Opening.tscn")

func _on_Quit_pressed():
	get_tree().quit()
