extends Node2D

func _ready():
	update_other_match_in_round()
	display_round_result()

# Update Logic for next matches
func update_other_match_in_round():
	var winner = null
	for pairing in GameData.next_matches:
		if pairing.team1 == PlayerData.player || pairing.team2 == PlayerData.player:
			winner = BattleData.battle_history.winner
		else:
			print("Computer vs Computer")
			# Determine the winner using a random coin flip
			if randi() % 2 == 0:
				winner = pairing.team1  # team1 wins
			else:
				winner = pairing.team2  # team2 wins
		
		print("Winner:", winner.name)
		BattleData.battle_winners.append(winner)
	# If no matches left, print completion
	if BattleData.battle_winners.size() == 0:
		print("No more matches!")
		return
	
	# Generate the next round pairings
	var next_round = create_duos(BattleData.battle_winners)
	print("Next Round Pairings:", next_round)
	
	# Update tournament matches with the new round
	GameData.tournament_matches.append(next_round)
	GameData.next_matches = next_round  # Set next matches to the next round

# Change this name	
func display_round_result():
	$BattleResultLabel.text = BattleData.battle_history.winner.name + " wins!"
	print(BattleData.battle_history)
	print("Updated Tournament Matches:", GameData.tournament_matches)
	print("Next Matches:", GameData.next_matches)

func _on_continue_button_pressed() -> void:
	reset_battle_data()
	print(BattleData.battle_history)
	get_tree().change_scene_to_file("res://Scenes/tournament.tscn")


func reset_battle_data():
	BattleData.battle_history = []
	BattleData.game_active = false
	BattleData.player_number = 0
	BattleData.computer = null
	BattleData.computer_name = null
	BattleData.computer_strategy = null
	BattleData.battle_winners = []

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
