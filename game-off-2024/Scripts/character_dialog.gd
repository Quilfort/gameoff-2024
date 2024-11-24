extends Node2D

var is_dialog_visible = true

func _ready():
	# Make sure the dialog is visible initially
	set_dialog_visible(true)
	# Enable input processing
	set_process_input(true)

func _input(event):
	# Check for mouse click or touch input
	if event is InputEventMouseButton or event is InputEventScreenTouch:
		if event.pressed:
			# Hide the entire CanvasLayer when screen is clicked
			set_dialog_visible(false)

func set_dialog_visible(visible: bool):
	is_dialog_visible = visible
	# Hide/show the entire CanvasLayer
	%CanvasLayer.visible = visible

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

# Optional: Function to show dialog again if needed
func show_dialog():
	set_dialog_visible(true)
