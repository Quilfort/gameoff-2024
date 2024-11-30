extends Node2D

var background_image_path = "res://Assets/Background/bg_battle_blur.png" 

func _ready():
	%MenuBackground.set_background(background_image_path)



func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/settings.tscn")


func _on_exit_button_pressed() -> void:
	#Add ConfirmationModal
	get_tree().quit()
