extends Node2D

var MAX_PLAYERS = GameData.MAX_PLAYERS
var computer_opponents = [] 
var upcoming_matches = [] 

func _ready():
	# Check if the draft has already been completed
	if !GameData.DRAFT_COMPLETED:
		start_draft()
		GameData.DRAFT_COMPLETED = true
	else:
		print("Draft already completed. Skipping draft.")
		display_schedule()

# Function to display the tournament schedule with rounds
func display_schedule():
	var schedule_text = "Tournament Schedule:\n\n"
	
	if !GameData.tournament_champion:
		# Iterate through each round in the tournament matches
		for round_index in range(GameData.tournament_matches.size()):
			var round_matches = GameData.tournament_matches[round_index]
			schedule_text += "Round %d:\n" % (round_index + 1)
			
			# Iterate through matches in the current round
			for match in round_matches:
				var team1 = match["team1"].name
				var team2 = match["team2"].name
				schedule_text += "  %s vs %s\n" % [team1, team2]
			
			schedule_text += "\n"  # Add spacing between rounds
	else:
		schedule_text += "Champion: \n"
		schedule_text += GameData.tournament_champion.name
	
	# Set the text to the TournamentScheduleLabel
	$TournamentScheduleLabel.text = schedule_text

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
	# print("Full Matches")
	# print(GameData.tournament_matches)
	
	# Display the pairings in the TournamentScheduleLabel
	display_schedule()
	
# Function to randomly draft MAX_PLAYERS - 1 computers
func draft_opponents():
	var all_computers = ComputerData.get_all_computers()
	all_computers.shuffle()  # Randomize the order
	
	# Select MAX_PLAYERS - 1 computers
	return all_computers.slice(0, MAX_PLAYERS - 1)
	
# Function to create duos
func create_duos_draft(participants):
	participants.shuffle()  # Shuffle the participants list
	var pairings = []
	
	# Pair participants into duos
	for i in range(0, participants.size(), 2):
		if i + 1 < participants.size():
			pairings.append({"team1": participants[i], "team2": participants[i + 1]})
	return pairings

func _on_next_battle_button_pressed() -> void:
	# Simulate each match
	for pairing in GameData.next_matches:
		print("Match:", pairing)
		# Check if the Player is in team1 or team2 of the current pairing
		if pairing.team1 == PlayerData.player || pairing.team2 == PlayerData.player:
			print("Player is in team")
			if pairing.team1 == PlayerData.player:
				BattleData.computer = pairing.team2  # Set opponent as team2
			else:
				BattleData.computer = pairing.team1  # Set opponent as team1
			get_tree().change_scene_to_file("res://Scenes/before_battle.tscn")
			return
	
	# Sim full matches if player is eliminated (Of do this in after_battle.gd)
	
	
