extends Node2D

var is_dialog_visible = true

func _ready():
	# Make sure the dialog is visible initially
	set_dialog_visible(true)
	# Enable input processing
	set_process_input(true)

func _input(event):
	# Check for left mouse button
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			# Hide the entire CanvasLayer when left mouse button is clicked
			set_dialog_visible(false)
	# Check for touch input (for mobile)
	elif event is InputEventScreenTouch:
		if event.pressed:
			# Hide the entire CanvasLayer when screen is touched
			set_dialog_visible(false)

func set_dialog_visible(new_visibility: bool):
	is_dialog_visible = new_visibility
	# Hide/show the entire CanvasLayer
	%CanvasLayer.visible = new_visibility

func setup_character_dialog():
	var scene = get_scene_name()
	
	match scene:
		"tournament":
			if GameData.tournament_champion:
				update_champion()
			else:
				set_dialog_visible(false)
		"before_battle":
			update_before_battle_dialog()
			init_character(BattleData.computer.character_path)
		"after_battle":
			update_after_battle_dialog()
			init_character(BattleData.computer.character_path)
		_:
			set_dialog_visible(false)

func update_before_battle_dialog():
	%SpeakerLabel.text = get_first_name(BattleData.computer.name)
	%DialogText.text = BattleData.computer.before_battle_text

func update_battle_dialog(initiative_text):
	set_dialog_visible(true)
	%SpeakerLabel.text = get_first_name(BattleData.computer.name)
	%DialogText.text = initiative_text
	init_character(BattleData.computer.character_path)

func update_after_battle_dialog():
	%SpeakerLabel.text = get_first_name(BattleData.computer.name)
	
	if PlayerData.player == BattleData.battle_history.winner:
		%DialogText.text = BattleData.computer.defeat_text
	else:
		%DialogText.text = BattleData.computer.victory_text

func update_champion():
	%SpeakerLabel.text = get_first_name(GameData.tournament_champion.name)
	
	if GameData.tournament_champion == PlayerData.player:
		%DialogText.text = "Congratulations, you have claimed the throne, champion!\nAnd you did it in %d guesses!" % PlayerData.player.total_attempts
		%Character.visible = false
		# Go to credits or main menu
	else:
		%DialogText.text = GameData.tournament_champion.champion_text
		init_character(GameData.tournament_champion.character_path)
		# Restart game or main menu


func init_character(character_path):
	var texture = load(character_path)
	
	if texture:
		%Character.texture = texture
	else:
		# print("Failed to load texture from path:", character_path)
		pass

func init_text():
	%SpeakerLabel.text = "Hello"
	%DialogText.text = "Something went wrong"

func get_first_name(full_name):
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
		return scene_name
	else:
		# print("No current scene found!")
		return ""

# Optional: Function to show dialog again if needed
func show_dialog():
	set_dialog_visible(true)
