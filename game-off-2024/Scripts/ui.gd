extends Control
class_name UI

@onready var nickname_label = $PlayerInfoBox/Nickname
@onready var number_label = $PlayerInfoBox/NumberText

var number = 0
var nickname =  "Temp"

func update_player_info():
	nickname_label.text = BattleData.computer.name
	
