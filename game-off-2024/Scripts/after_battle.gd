extends Node2D

func _ready():
	update_next_match()
	setup_battle_result()

# Change this name	
func setup_battle_result():
	$BattleResultLabel.text = BattleData.battle_history.winner + " wins!"
	print(BattleData.battle_history)
	print(GameData.next_matches)

# Update Logic for next matches
func update_next_match():
	print(GameData.next_matches)

func reset_battle_data():
	BattleData.battle_history = []
	BattleData.game_active = false
	BattleData.player_number = 0
	BattleData.computer = null
	BattleData.computer_name = null
	BattleData.computer_strategy = null

func _on_continue_button_pressed() -> void:
	reset_battle_data()
	print(BattleData.battle_history)
	get_tree().change_scene_to_file("res://Scenes/tournament.tscn")
