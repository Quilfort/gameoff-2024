extends Node2D

var MAX_PLAYERS = GameData.MAX_PLAYERS
var computer_opponents = []  # List to store selected computers
var player = {"id": 0, "name": "Player", "computer_strategy": "manual"}

func _ready():
	# Check if the draft has already been completed
	if !GameData.DRAFT_COMPLETED:
		start_draft()
		GameData.DRAFT_COMPLETED = true
	else:
		print("Draft already completed. Skipping draft.")

# Function to display the tournament schedule
func display_schedule():
	var schedule_text = "Tournament Schedule:\n\n"
	
	for match in GameData.tournament_matches:
		var team1 = match["team1"].name
		var team2 = match["team2"].name
		schedule_text += "%s vs %s\n" % [team1, team2]
	
	$TournamentScheduleLabel.text = schedule_text
	print(schedule_text)  # For debugging/logging

## DRAFT
# Function to handle the entire draft process
func start_draft():
	# Draft the opponents
	computer_opponents = draft_opponents()
	
	# Add the player to the list
	var participants = computer_opponents.duplicate()
	participants.append(player)
	
	# Randomize and pair participants
	var pairings = create_duos(participants)
	GameData.tournament_matches = pairings
	GameData.next_matches = pairings
	print(GameData.tournament_matches)
	
	# Display the pairings in the TournamentScheduleLabel
	display_schedule()
	
# Function to randomly draft MAX_PLAYERS - 1 computers
func draft_opponents():
	var all_computers = ComputerData.get_all_computers()
	all_computers.shuffle()  # Randomize the order
	
	# Select MAX_PLAYERS - 1 computers
	return all_computers.slice(0, MAX_PLAYERS - 1)
	
# Function to create random duos
func create_duos(participants):
	participants.shuffle()  # Shuffle the participants list
	var pairings = []
	
	# Pair participants into duos
	for i in range(0, participants.size(), 2):
		if i + 1 < participants.size():
			pairings.append({"team1": participants[i], "team2": participants[i + 1]})
	return pairings


func _on_next_battle_button_pressed() -> void:
	for pairing in GameData.next_matches:
		# Check if the Player is in team1 or team2 of the current pairing
		if pairing.team1.id == 0:  # Player is in team1
			BattleData.computer = pairing.team2  # Set opponent as team2
			get_tree().change_scene_to_file("res://Scenes/before_battle.tscn")
			return
		elif pairing.team2.id == 0:  # Player is in team2
			BattleData.computer = pairing.team1  # Set opponent as team1
			get_tree().change_scene_to_file("res://Scenes/before_battle.tscn")
			return
	
	# If no matching pairing is found, you could print a message or handle it in some way
	print("No battle found for the Player in the tournament matches.")
