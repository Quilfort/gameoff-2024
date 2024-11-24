extends Node2D

func setup_character_dialog():
	var scene = get_scene_name()
	
	match scene:
		"tournament":
			init_text()
		"before_battle":
			update_before_battle_dialog()
			init_character()
		"battle":
			update_battle_dialog()
			init_character()
		"after_battle":
			update_after_battle_dialog()
			init_character()
		_:
			init_text()


func update_before_battle_dialog():
	%SpeakerLabel.text = get_first_name()
	%DialogText.text = BattleData.computer.before_battle_text


func update_battle_dialog():
	%SpeakerLabel.text = get_first_name()
	%DialogText.text = BattleData.computer.battle_text


func update_after_battle_dialog():
	%SpeakerLabel.text = get_first_name()
	
	if PlayerData.player == BattleData.battle_history.winner:
		%DialogText.text = BattleData.computer.defeat_text
	else:
		%DialogText.text = BattleData.computer.victory_text


func init_character():
	var texture = load(BattleData.computer.character_path)
	
	if texture:
		%Character.texture = texture
	else:
		print("Failed to load texture from path:", BattleData.computer.character_path)


func init_text():
	%SpeakerLabel.text = "Hello"
	%DialogText.text = "Something went wrong"


func get_first_name():
	# Split name and return first name or full_name 
	var full_name = BattleData.computer.name
	var name_parts = full_name.split(" ")
	
	if name_parts.size() > 1:
		return name_parts[0]
	else:
		return full_name


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
