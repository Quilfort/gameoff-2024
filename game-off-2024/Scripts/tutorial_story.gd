extends Node2D

var background_image_path = "res://Assets/Background/bg_settings.jpg" 

func _ready():
	%MenuBackground.set_background(background_image_path)


func _on_next_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/tournament.tscn")
