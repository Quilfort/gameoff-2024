extends Node2D

var player_number = 0


func _ready():
	setup_game()


func setup_game():
	BattleData.game_active = false
	$StartLabel.text = "Choice your Pokemon between 1 and %d." % GameData.MAX_NUMBER


func _on_start_button_pressed() -> void:
	if !BattleData.game_active:
		player_number = $GuessInput.text.to_int()
		if player_number < 1 or player_number > GameData.MAX_NUMBER:
			$StartLabel.text = "Please enter a number between 1 and %d." % GameData.MAX_NUMBER
			return
		BattleData.game_active = true
		BattleData.player_number = player_number
		# Set Computer Data
		$GuessInput.clear()
		get_tree().change_scene_to_file("res://Scenes/battle.tscn")
