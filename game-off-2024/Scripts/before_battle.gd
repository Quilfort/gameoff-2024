extends Node2D

var MAX_NUMBER = 500

var player_number = 0
var game_started = false   

func _ready():
	setup_game()

func setup_game():
	$StartLabel.text = "Choice your Pokemon between 1 and %d." % MAX_NUMBER

func _on_start_button_pressed() -> void:
	if !game_started:
		player_number = $GuessInput.text.to_int()
		if player_number < 1 or player_number > MAX_NUMBER:
			$StartLabel.text = "Please enter a number between 1 and %d." % MAX_NUMBER
			return
		game_started = true
		BattleData.game_started = game_started
		BattleData.player_number = player_number
		BattleData.computer_strategy = "normal"
		$GuessInput.clear()
		BattleData.MAX_NUMBER = MAX_NUMBER
		get_tree().change_scene_to_file("res://Scenes/battle.tscn")


func _on_even_button_pressed() -> void:
	if !game_started:
		player_number = $GuessInput.text.to_int()
		if player_number < 1 or player_number > MAX_NUMBER:
			$StartLabel.text = "Please enter a number between 1 and %d." % MAX_NUMBER
			return
		game_started = true
		BattleData.game_started = game_started
		BattleData.player_number = player_number
		BattleData.computer_strategy = "even"
		$GuessInput.clear()
		BattleData.MAX_NUMBER = MAX_NUMBER
		get_tree().change_scene_to_file("res://Scenes/battle.tscn")
