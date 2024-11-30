extends Node2D

var background_image_path = "res://Assets/Background/bg_battle_blur.png" 

func _ready() -> void:
	#Set Background
	%MenuBackground.set_background(background_image_path)
	# Set text
	%ChampionTextLabel.text = "Glory is yours, %s!\nYou have claimed the 500 Numbers Throne.\n\nRule the kingdom with honor for the next 10 years."  % PlayerData.player.name

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


func _on_main_menu_button_pressed() -> void:
	reset_game()
	reset_settings()
	get_tree().change_scene_to_file("res://Scenes/Menu/main.tscn")


func _on_exit_button_pressed() -> void:
	#Add ConfirmationModal
	get_tree().quit()
