extends Node2D

func setup_character_dialog():
	init_text()
	init_character()


func init_text():
	%SpeakerLabel.text = get_first_name()
	%DialogText.text = BattleData.computer.before_battle_text


func init_character():
	var texture = load(BattleData.computer.character_path)
	
	if texture:
		%Character.texture = texture
	else:
		print("Failed to load texture from path:", BattleData.computer.character_path)


func get_first_name():
	# Split name and return first name or full_name 
	var full_name = BattleData.computer.name
	var name_parts = full_name.split(" ")
	
	if name_parts.size() > 1:
		return name_parts[0]
	else:
		return full_name
