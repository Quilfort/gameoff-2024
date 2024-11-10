extends Node2D


var player_number = 0
var game_started = false

func _ready():
	setup_game()

func setup_game():
	print(BattleData.computer)
	$StartLabel.text = "Choice your Pokemon between 1 and %d." % BattleData.MAX_NUMBER

func _on_start_button_pressed() -> void:
	if !game_started:
		player_number = $GuessInput.text.to_int()
		if player_number < 1 or player_number > BattleData.MAX_NUMBER:
			$StartLabel.text = "Please enter a number between 1 and %d." % BattleData.MAX_NUMBER
			return
		game_started = true
		# Set Battle Data
		BattleData.game_started = game_started
		BattleData.player_number = player_number
		# Set Computer Data
		$GuessInput.clear()
		get_tree().change_scene_to_file("res://Scenes/battle.tscn")
