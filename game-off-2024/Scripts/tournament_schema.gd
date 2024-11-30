extends Node2D

var MAX_PLAYERS = GameData.MAX_PLAYERS
var computer_opponents = []
var upcoming_matches = []

func _ready():
	GameData.game_active = true;
	# Check if the draft has already been completed
	if !GameData.DRAFT_COMPLETED:
		start_draft()
		GameData.DRAFT_COMPLETED = true
	else:
		display_schedule()
	
	setup_ui();


func setup_ui():
	%UI.setup_ui()
	%CharacterDialog.setup_character_dialog()


func _input(event):
	# Check for left mouse button
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			# Hide the entire CanvasLayer when left mouse button is clicked
			game_over()
	# Check for touch input (for mobile)
	elif event is InputEventScreenTouch:
		if event.pressed:
			# Hide the entire CanvasLayer when screen is touched
			game_over()


func game_over():
	if !GameData.game_active && GameData.tournament_champion:
		if GameData.tournament_champion == PlayerData.player:
			#code for credits
			print("player")
			get_tree().change_scene_to_file("res://Scenes/credits.tscn")
		else:
			print("computer")
			get_tree().change_scene_to_file("res://Scenes/Menu/restart_menu.tscn")


## DRAFT
# Function to handle the entire draft process
func start_draft():
	# Draft the opponents
	computer_opponents = draft_opponents()

	# Add the player to the list
	var participants = computer_opponents.duplicate()
	participants.append(PlayerData.player)

	# Randomize and pair participants
	var pairings = create_duos_draft(participants)
	GameData.tournament_matches = [pairings]
	GameData.next_matches = pairings

	# Display the pairings in the TournamentScheduleLabel
	display_schedule()


# Function to randomly draft MAX_PLAYERS - 1 computers
func draft_opponents():
	var all_computers = ComputerData.get_all_computers()
	all_computers.shuffle()  # Randomize the order

	# Select MAX_PLAYERS - 1 computers
	return all_computers.slice(0, MAX_PLAYERS - 1)



func display_schedule():
	# Update the text label
	if GameData.tournament_champion:
		display_champion()
	else:
		if $TournamentBracket:
			$TournamentBracket.update_bracket()
		else:
			var schedule_text = "Tournament Schedule:\n\n"
			if !GameData.tournament_champion:
				for round_index in range(GameData.tournament_matches.size()):
					var round_matches = GameData.tournament_matches[round_index]
					schedule_text += "Round %d:\n" % (round_index + 1)
					for match in round_matches:
						var team1 = match["team1"].name
						var team2 = match["team2"].name
						schedule_text += "  %s vs %s\n" % [team1, team2]
					schedule_text += "\n"
			else:
				schedule_text += "Champion: \n"
				schedule_text += GameData.tournament_champion.name
			
			$TournamentScheduleLabel.text = schedule_text


func display_champion():
	GameData.game_active = false;
	%NextBattleButton.visible = false

func _on_next_battle_button_pressed() -> void:
	# Simulate each match
	for pairing in GameData.next_matches:
		# Check if the Player is in team1 or team2 of the current pairing
		if pairing.team1 == PlayerData.player || pairing.team2 == PlayerData.player:
			if pairing.team1 == PlayerData.player:
				BattleData.computer = pairing.team2  # Set opponent as team2
			else:
				BattleData.computer = pairing.team1  # Set opponent as team1
			get_tree().change_scene_to_file("res://Scenes/before_battle.tscn")
			return


# Function to create duos
func create_duos_draft(participants):
	participants.shuffle()  # Shuffle the participants list
	var pairings = []

	# Pair participants into duos
	for i in range(0, participants.size(), 2):
		if i + 1 < participants.size():
			pairings.append({"team1": participants[i], "team2": participants[i + 1]})
	return pairings
