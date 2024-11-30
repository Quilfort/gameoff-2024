extends Node2D

var player_number = 0


func _ready():
	setup_game()


# Add visibility check to input handling
func _input(event):
	var dialog_visible = %CharacterDialog.get_node("%CanvasLayer").visible
	
	if !dialog_visible:
		# Show UI elements once dialog is hidden
		%UI.set_background("res://Assets/Background/bg_tournament_blur.png")
		%PlayerChoice.visible = true

func setup_game():	
	setup_general_ui()
	BattleData.battle_active = false
	%StartLabel.text = "Choose thy number wisely, between 1 and %d. \n\nThy claim to the throne rests upon this fateful choice!" % GameData.MAX_NUMBER


func setup_general_ui():
	%CharacterDialog.setup_character_dialog()
	%UI.setup_ui()
	%UI.set_background("res://Assets/Background/bg_tournament.png")
	%PlayerChoice.visible = false

func set_computer_number():
	StrategyData.choose_computer_number()




func _on_start_button_pressed() -> void:
	if !BattleData.battle_active:
		player_number = %GuessInput.text.to_int()
		if player_number < 1 or player_number > GameData.MAX_NUMBER:
			%StartLabel.text = "Please enter a number between 1 and %d." % GameData.MAX_NUMBER
			return
		BattleData.battle_active = true
		BattleData.player_number = player_number
		%GuessInput.clear()
		# Set Computer Data
		set_computer_number()
		get_tree().change_scene_to_file("res://Scenes/battle.tscn")
