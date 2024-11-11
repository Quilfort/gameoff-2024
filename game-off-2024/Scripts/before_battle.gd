extends Node2D


var player_number = 0
var game_active = false

func _ready():
	setup_game()

func setup_game():
	print(BattleData.computer)
	$StartLabel.text = "Choice your Pokemon between 1 and %d." % GameData.MAX_NUMBER

func _on_start_button_pressed() -> void:
	if !game_active:
		player_number = $GuessInput.text.to_int()
		if player_number < 1 or player_number > GameData.MAX_NUMBER:
			$StartLabel.text = "Please enter a number between 1 and %d." % GameData.MAX_NUMBER
			return
		game_active = true
		# Set Battle Data
		BattleData.game_active = game_active
		BattleData.player_number = player_number
		# Set Computer Data
		$GuessInput.clear()
		get_tree().change_scene_to_file("res://Scenes/battle.tscn")
