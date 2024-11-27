extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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


func _on_main_menu_button_pressed() -> void:
	reset_game()
	reset_settings()
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_exit_button_pressed() -> void:
	#Add ConfirmationModal
	get_tree().quit()
