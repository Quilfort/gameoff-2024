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
	
	# Display the pairings in the TournamentScheduleLabel
	display_schedule(pairings)
	
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
	
# Function to display the tournament schedule
func display_schedule(pairings):
	var schedule_text = "Tournament Schedule:\n\n"
	
	for pair in pairings:
		var team1 = pair["team1"].name
		var team2 = pair["team2"].name
		schedule_text += "%s vs %s\n" % [team1, team2]
	
	$TournamentScheduleLabel.text = schedule_text
	print(schedule_text)  # For debugging/logging
