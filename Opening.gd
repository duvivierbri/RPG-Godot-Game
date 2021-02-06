extends Node2D

func _ready():
	$chocolate.play()

func _on_Start_pressed():
	get_tree().change_scene("res://Scene1.tscn")

func _on_Credit_button_up():
	get_tree().change_scene("res://Credits.tscn")

func _on_Quit_button_up():
	get_tree().quit()
