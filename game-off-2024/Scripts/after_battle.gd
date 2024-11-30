extends Node2D

#Bool for the computer games
var continue_game = true

func _ready():
	setup_general_ui()
	display_round_result()
	update_other_match_in_round()


func setup_general_ui():
	%CharacterDialog.setup_character_dialog()
	%UI.setup_ui()
	%UI.set_background("res://Assets/Background/bg_tournament.png")
	%Results.visible = false;


# Add visibility check to input handling
func _input(event):
	var dialog_visible = %CharacterDialog.get_node("%CanvasLayer").visible
	
	if !dialog_visible:
		# Show UI elements once dialog is hidden
		%UI.set_background("res://Assets/Background/bg_tournament_blur.png")
		%Results.visible = true;

# Update Logic for next matches
func update_other_match_in_round():
	var winner = null
	for pairing in GameData.next_matches:
		if pairing.team1 == PlayerData.player || pairing.team2 == PlayerData.player:
			winner = BattleData.battle_history.winner
		else:
			if randi() % 2 == 0:
				winner = pairing.team1
			else:
				winner = pairing.team2

		BattleData.battle_winners.append(winner)

	if is_player_still_in_winners():
		player_not_eliminated()
	else:
		player_eliminated()


func player_not_eliminated():
	# Generate the next round pairings
	show_total_attempts()
	var next_round = create_duos(BattleData.battle_winners)

	# Update tournament matches with the new round
	GameData.tournament_matches.append(next_round)
	if next_round.size() > 0:
		GameData.next_matches = next_round  # Set next matches to the next round
	else:
		GameData.tournament_champion = BattleData.battle_winners[0]


func player_eliminated():
	if continue_game:
		while BattleData.battle_winners.size() > 1:  # Continue until there's only one winner
			# Generate the next round pairings from the current winners
			var next_round = create_duos(BattleData.battle_winners)

			# Reset the battle winners for the new round
			reset_battle_data()

			# Simulate the matches for the next round
			for pairing in next_round:
				var winner = null

				if randi() % 2 == 0:
					winner = pairing.team1
				else:
					winner = pairing.team2

				BattleData.battle_winners.append(winner)

			# Update the tournament matches and next matches
			GameData.tournament_matches.append(next_round)
			GameData.next_matches = next_round

		# Declare the champion
		show_computer_results()
		GameData.tournament_champion = BattleData.battle_winners[0]


func show_computer_results():
	%StatusResultLabel.text = "GAME OVER!"


func show_total_attempts():
	# Calculate the status values
	var current_attempts = PlayerData.player.total_attempts - BattleData.player_attempts
	var battle_attempts = BattleData.player_attempts
	var total_attempts = PlayerData.player.total_attempts

	# Add a descriptive header
	var current_text = "Current Attempts: \t\t%d\n" % current_attempts
	var battle_text = "Battle Attempts: \t\t%d\n" % battle_attempts
	var total_text = "Total Attempts: \t\t%d" % total_attempts

	# Format the result string with line breaks for readability
	var status_result = "%s\n%s\n%s" % [
		current_text,
		battle_text,
		total_text
	]

	# Assign the formatted string to the label
	%StatusResultLabel.text = status_result


func display_round_result():
	%BattleResultLabel.text = BattleData.battle_history.winner.name + " wins!"


func _on_continue_button_pressed() -> void:
	reset_battle_data()
	get_tree().change_scene_to_file("res://Scenes/tournament.tscn")


func reset_battle_data():
	BattleData.battle_history = []
	BattleData.battle_active = false
	BattleData.player_number = 0
	BattleData.computer = null
	BattleData.battle_winners = []
	BattleData.computer_min = 0
	BattleData.computer_max = 0
	BattleData.last_guess = 0
	BattleData.half_guess_difference = 0
	BattleData.is_guess_too_low = false
	BattleData.is_guess_too_high = false
	BattleData.computer_previous_guesses = []	
	BattleData.player_guess = 0	
	BattleData.computer_number = 0
	BattleData.player_attempts = 0


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


func is_player_still_in_winners() -> bool:
	return PlayerData.player in BattleData.battle_winners
