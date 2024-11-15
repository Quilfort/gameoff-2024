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

# Function to display the tournament schedule
func display_schedule():
	var schedule_text = "Tournament Schedule:\n\n"
	
	for match in GameData.tournament_matches:
		var team1 = match["team1"].name
		var team2 = match["team2"].name
		schedule_text += "%s vs %s\n" % [team1, team2]
	
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
	var pairings = create_duos(participants)
	GameData.tournament_matches = pairings
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
func create_duos(participants):
	if !GameData.DRAFT_COMPLETED:
		participants.shuffle()  # Shuffle the participants list
	var pairings = []
	
	# Pair participants into duos
	for i in range(0, participants.size(), 2):
		if i + 1 < participants.size():
			pairings.append({"team1": participants[i], "team2": participants[i + 1]})
	return pairings

func _on_next_battle_button_pressed() -> void:
	
	var winners = []
	
	# Simulate each match
	for pairing in GameData.next_matches:
		print("Match:", pairing)
		var winner = null
		# Check if the Player is in team1 or team2 of the current pairing
		if pairing.team1 == PlayerData.player || pairing.team2 == PlayerData.player:
			print("Player is in team")
			if randi() % 2 == 0:
				winner = pairing.team1  # team1 wins
			else:
				winner = pairing.team2  # team2 wins
			#BattleData.computer = pairing.team2  # Set opponent as team2
			#BattleData.computer = pairing.team1  # Set opponent as team1
			#get_tree().change_scene_to_file("res://Scenes/before_battle.tscn")
			#return	
		else:
			print("Computer vs Computer")
			# Determine the winner using a random coin flip
			if randi() % 2 == 0:
				winner = pairing.team1  # team1 wins
			else:
				winner = pairing.team2  # team2 wins
		
		print("Winner:", winner.name)
		winners.append(winner)
	
	# If no matches left, print completion
	if winners.size() == 0:
		print("No more matches!")
		return
	
	# Generate the next round pairings
	var next_round = create_duos(winners)
	print("Next Round Pairings:", next_round)
	
	# Update tournament matches with the new round
	GameData.tournament_matches.append(next_round)
	GameData.next_matches = next_round  # Set next matches to the next round
	
	print("Updated Tournament Matches:", GameData.tournament_matches)
	print("Next Matches:", GameData.next_matches)
