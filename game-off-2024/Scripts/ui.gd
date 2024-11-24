extends Control
class_name UI

# Background
@onready var background_image = $CanvasLayer/Background

# Player Info Box
@onready var player_info_box = $PlayerInfo/PlayerInfoBox
@onready var nickname_label = $PlayerInfo/PlayerInfoBox/Nickname
@onready var number_label = $PlayerInfo/PlayerInfoBox/NumberText
@onready var avatar_image = $"PlayerInfo/PlayerInfoBox/Avatar Frame/Avatar"

#Tournament UI

var number = 0
var nickname =  "Temp"


func setup_ui():
	var scene = get_scene_name()
	
	match scene:
		"tournament":
			update_tournament_ui()
		"before_battle":
			update_before_battle_ui()
		"battle":
			update_battle_ui()
		"after_battle":
			update_after_battle_ui()
		_:
			player_info_box.visible = true
			update_player_info()


func update_player_info():
	#Set Name
	nickname_label.text = BattleData.computer.name
	
	# Set Avatar
	var texture = load(BattleData.computer.avatar_path)
	
	if texture:
		avatar_image.texture = texture
	else:
		print("Failed to load texture from path:", BattleData.computer.avatar_path)


func update_tournament_ui():
	set_background("res://Assets/Background/bg_tournament_blur.png")
	player_info_box.visible = false


func update_before_battle_ui():
	set_background("res://Assets/Background/bg_tournament_blur.png")
	player_info_box.visible = true
	update_player_info()


func update_battle_ui():
	set_background("res://Assets/Background/bg_battle_blur.png")
	player_info_box.visible = true
	update_player_info()


func update_after_battle_ui():
	set_background("res://Assets/Background/bg_tournament_blur.png")
	player_info_box.visible = true
	update_player_info()

func get_scene_name() -> String:
	var current_scene = get_tree().get_current_scene()
	if current_scene:
		var scene_path = current_scene.get_scene_file_path()
		var scene_name = scene_path.get_file().get_basename()
		return scene_name
	else:
		print("No current scene found!")
		return ""


func set_background(background_path):
	var texture = load(background_path)
	
	if texture:
		background_image.texture = texture
	else:
		print("Failed to load texture from path:", background_path)
