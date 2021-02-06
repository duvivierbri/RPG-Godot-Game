extends Node2D

func _ready():
	$home.play()

func _on_Button_button_up():
	get_tree().change_scene("res://Opening.tscn")
