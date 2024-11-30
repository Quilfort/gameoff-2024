extends Node2D

var player_name = ""
var background_image_path = "res://Assets/Background/bg_settings.jpg" 


func _ready():
	%MenuBackground.set_background(background_image_path)


func check_player_name():
	#Should also Check front Name
	var player_name = %PlayerNameInput.text
	
	# Check if player_name is 16 characters or less
	if player_name.length() > 16:
		%PlayerNameErrorLabel.text = "Full Name is too long. Must be 16 characters or less."
		return false
	
	# Check if first name is 12 characters or less
	var first_name = get_first_name(player_name)
	if first_name.length() > 12:
		%PlayerNameErrorLabel.text = "First Name is too long. Must be 12 characters or less."
		return false

	# Create and compile the regex
	var regex = RegEx.new()
	regex.compile(r"^[a-zA-Z0-9\s\-]+$") # Allow letters, numbers, spaces, and '-'
	
	# Check if the name matches the regex
	if not regex.search(player_name):
		%PlayerNameErrorLabel.text = "Only letters, numbers, spaces, and '-' are allowed."
		return false

	# print("Name is valid:", player_name)
	PlayerData.player.name = player_name
	return true


func get_first_name(full_name):
	var name_parts = full_name.split(" ")
	
	if name_parts.size() > 1:
		return name_parts[0]
	else:
		return full_name


#Buttons
func _on_go_tutorial_button_pressed() -> void:
	# Should go to tutorial
	if check_player_name():
		get_tree().change_scene_to_file("res://Scenes/tutorial_story.tscn")


func _on_skip_tutorial_button_pressed() -> void:
	if check_player_name():
		get_tree().change_scene_to_file("res://Scenes/tournament.tscn")
