extends Node2D



func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/settings.tscn")


func _on_exit_button_pressed() -> void:
	#Add ConfirmationModal
	get_tree().quit()