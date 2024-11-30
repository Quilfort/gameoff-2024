extends Node2D


var background_image_path = "res://Assets/Background/bg_battle_blur.png" 

func _ready():
	#Set Background
	%MenuBackground.set_background(background_image_path)
	#Set text


	%GameOverLabel.text ="The hour of reckoning has arrived, %s.\n\nThe kingdom's demise is all but sealed. But you still have a chance to turn the tide of history. Reclaim your rightful place on the throne within 10 years, or be forever shrouded in the shadows of forgotten glory." % PlayerData.player.name
func reset_game():
	# GameData
	GameData.game_active = false
	GameData.DRAFT_COMPLETED = false
	GameData.tournament_matches = []
	GameData.next_matches = []
	GameData.tournament_champion = null
	#PlayerData
	PlayerData.player.total_attempts = 0

func reset_settings():
	PlayerData.player.name = ""
	GameData.random_mode = false


func _on_restart_button_pressed() -> void:
	#function to reset game
	reset_game()
	get_tree().change_scene_to_file("res://Scenes/tournament.tscn")


func _on_main_menu_button_pressed() -> void:
	reset_game()
	reset_settings()
	get_tree().change_scene_to_file("res://Menu/Scenes/main.tscn")


func _on_exit_button_pressed() -> void:
	#Add ConfirmationModal
	get_tree().quit()
