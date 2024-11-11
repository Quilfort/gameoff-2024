extends Node2D

func _ready():
	setup_battle_result()
	
func setup_battle_result():
	$BattleResultLabel.text = BattleData.battle_history.winner + " wins!"
	print(BattleData.battle_history)
	
func _on_continue_button_pressed() -> void:
	pass # Replace with function body.
