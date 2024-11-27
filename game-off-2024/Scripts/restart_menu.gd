extends Node2D


func _ready():
	#Set Background
	%GameOverLabel.text = "The kingdom fell, %s. Reclaim it in 10 years" % PlayerData.player.name

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


func _on_restart_button_pressed() -> void:
	#function to reset game
	reset_game()
	get_tree().change_scene_to_file("res://Scenes/tournament.tscn")


func _on_main_menu_button_pressed() -> void:
	reset_game()
	reset_settings()
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_exit_button_pressed() -> void:
	#Add ConfirmationModal
	get_tree().quit()
