extends Control
class_name UI

@onready var player_info_box = $PlayerInfoBox
@onready var nickname_label = $PlayerInfoBox/Nickname
@onready var number_label = $PlayerInfoBox/NumberText
@onready var avatar_image = $"PlayerInfoBox/Avatar Frame/Avatar"

var number = 0
var nickname =  "Temp"


func setup_ui(show_player_info):
	if show_player_info:
		$PlayerInfoBox.visible = show_player_info
		update_player_info()
	else:
		$PlayerInfoBox.visible = show_player_info
		update_tournament_ui()


func update_player_info():
	nickname_label.text = BattleData.computer.name
	
	var texture = load(BattleData.computer.avatar_path)
	
	if texture:
		avatar_image.texture = texture
	else:
		print("Failed to load texture from path:", BattleData.computer.avatar_path)


func update_tournament_ui():
	print("Tournament UI")
	#Update Top Bar with options of players? 
