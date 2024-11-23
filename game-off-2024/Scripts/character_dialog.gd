extends Node2D

func setup_character_dialog():
	init_text()


func init_text():
	%SpeakerLabel.text = BattleData.computer.name
	%DialogText.text = BattleData.computer.computer_strategy
