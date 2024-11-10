extends Node2D

func _ready():
	setup_battle_result()
	
func setup_battle_result():
	$BattleResultLabel.text = BattleData.computer.name
	
func _on_continue_button_pressed() -> void:
	pass # Replace with function body.
