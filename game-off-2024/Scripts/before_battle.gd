extends Node2D

var MAX_NUMBER = 500

var player_number = 0
var game_started = false

## Add Check to Default to Normal if Computer Name is not accesable
var computer_player = "normal"
var computer = ComputerData.get(computer_player)
var computer_name = computer.name
var computer_strategy = computer.computer_strategy.to_lower()

func _ready():
	setup_game()

func setup_game():
	$StartLabel.text = "Choice your Pokemon between 1 and %d." % MAX_NUMBER
	print(computer)

func _on_start_button_pressed() -> void:
	if !game_started:
		player_number = $GuessInput.text.to_int()
		if player_number < 1 or player_number > MAX_NUMBER:
			$StartLabel.text = "Please enter a number between 1 and %d." % MAX_NUMBER
			return
		game_started = true
		# Set Battle Data
		BattleData.game_started = game_started
		BattleData.player_number = player_number
		# Set Computer Data
		BattleData.computer_strategy = computer_strategy
		BattleData.computer_name = computer_name
		$GuessInput.clear()
		BattleData.MAX_NUMBER = MAX_NUMBER
		get_tree().change_scene_to_file("res://Scenes/battle.tscn")
