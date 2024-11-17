extends Control
class_name UI

# Player Info Box
@onready var player_info_box = $PlayerInfo/PlayerInfoBox
@onready var nickname_label = $PlayerInfo/PlayerInfoBox/Nickname
@onready var number_label = $PlayerInfo/PlayerInfoBox/NumberText
@onready var avatar_image = $"PlayerInfo/PlayerInfoBox/Avatar Frame/Avatar"
#Tournament UI
#Battle UI
@onready var battle_field = $BattleUI

var number = 0
var nickname =  "Temp"


func setup_ui():
	var scene = get_scene_name()
	
	match scene:
		"tournament":
			player_info_box.visible = false
			battle_field.visible = false
			update_tournament_ui()
		"battle":
			battle_field.visible = true
		_:
			player_info_box.visible = true
			battle_field.visible = false
			update_player_info()

func get_scene_name() -> String:
	var current_scene = get_tree().get_current_scene()
	if current_scene:
		var scene_path = current_scene.get_scene_file_path()
		var scene_name = scene_path.get_file().get_basename()
		print("Current scene name:", scene_name)
		return scene_name
	else:
		print("No current scene found!")
		return ""


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

func update_battle_ui():
	print("Live")
