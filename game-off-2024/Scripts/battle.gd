extends Node2D

@onready var ui = %UI;

# Game configuration
var game_active = BattleData.game_active    

# Player
var player_number = BattleData.player_number
var computer_number = 0
var player_attempts = 0
var is_player_turn = false 

#Computer
var computer_attempts = 0
var computer_timer = 0     
var computer_delay = 2.0

# Computer Strategy
var computer_min = 1
var computer_max = GameData.MAX_NUMBER
var computer_previous_guesses = []

# Variables for storing guess history
var player_guess_history = []
var computer_guess_history = []

# Flags for half_guess strategy
var last_guess = 0
var half_guess_difference = 0
var is_guess_too_low = false
var is_guess_too_high = false


func _ready():
	setup_game()
	setup_ui()


func reset_game():
	setup_game()
	setup_ui()

func setup_ui():
	ui.setup_ui()	


func _process(delta):
	if game_active and !is_player_turn:
		computer_timer += delta
		if computer_timer >= computer_delay:
			computer_timer = 0
			computer_guesses()
			is_player_turn = true
			$InstructionLabel.text = "Your turn! Make a guess (1-%d):" % GameData.MAX_NUMBER





func setup_game():
	computer_number = randi() % GameData.MAX_NUMBER + 1
	player_attempts = 0
	computer_attempts = 0
	computer_timer = 0
	computer_min = 1
	computer_max = GameData.MAX_NUMBER
	computer_previous_guesses.clear()
	player_guess_history.clear()
	computer_guess_history.clear()
	is_guess_too_high = false
	half_guess_difference = 0
	
	# Strings
	$InstructionLabel.text = ""
	$PlayerResultLabel.text = ""
	$ComputerGuessLabel.text = ""
	$ComputerResultLabel.text = ""
	$BattleStatusLabel.text = ""
	$PlayerHistoryLabel.text = ""
	$ComputerHistoryLabel.text = ""
	$GuessInput.clear()

	#Debug Print Numbers
	print("Computer Number:\t\t",computer_number)
	print("Player Number:\t\t",BattleData.player_number)

	#Logic to determine who starts
	which_player_starts()
	
	
func which_player_starts():
	# Random select Player
	is_player_turn = randi() % 2 == 0
	
	# Update Battle Status Label based on who starts
	if is_player_turn:
		$BattleStatusLabel.text = "You start! Make a guess."
		$InstructionLabel.text = "Your turn! Make a guess (1-%d):" % GameData.MAX_NUMBER
	else:
		$BattleStatusLabel.text = "Computer starts guessing..."
		$InstructionLabel.text = "Computer will guess in 2 seconds..."
		await get_tree().create_timer(2.0).timeout


func finish_game(number, winner):
	# Set game_active to false to prevent further guesses
	game_active = false

	# Store player and computer histories in BattleData.battle_history
	BattleData.battle_history = {
		"player": player_guess_history,
		"computer": computer_guess_history,
		"winner": winner,
		"number": number
	}

	await get_tree().create_timer(5.0).timeout
	get_tree().change_scene_to_file("res://Scenes/after_battle.tscn")


func update_history_display():
	var player_history_text = PlayerData.player.name + " Guesses:\n"
	for guess_info in player_guess_history:
		player_history_text += str(guess_info.guess) + " - " + guess_info.result + "\n"
	
	$PlayerHistoryLabel.text = player_history_text  # Update the player history label

	var computer_history_text = BattleData.computer.name + " Guesses:\n"
	for guess_info in computer_guess_history:
		computer_history_text += str(guess_info.guess) + " - " + guess_info.result + "\n"
	
	$ComputerHistoryLabel.text = computer_history_text  # Update the computer history label


func check_guess(guess: int):
	if !is_player_turn:
		return
		
	player_attempts += 1
	var result = ""
	
	if guess < computer_number:
		result = "Too low!"
		$BattleStatusLabel.text = "Wait for " + BattleData.computer.name + " 's turn..."
		$PlayerResultLabel.text = result
	elif guess > computer_number:
		result = "Too high!"
		$BattleStatusLabel.text = "Wait for " + BattleData.computer.name + " 's turn..."
		$PlayerResultLabel.text = result
	else:
		result = "Correct!"
		$BattleStatusLabel.text = "You Won"
		$PlayerResultLabel.text = "Correct! You won in " + str(player_attempts) + " attempts!"
		
	# Add guess to history
	player_guess_history.append({
		"guess": guess,
		"result": result
	})
	update_history_display()
	
	if guess == computer_number:
		finish_game(computer_number, PlayerData.player)
		
	is_player_turn = false 
	$InstructionLabel.text = BattleData.computer.name + " will guess in 2 seconds..."
	$GuessInput.clear()


func computer_guesses():
	var guess = smart_computer_guess()
	computer_previous_guesses.append(guess)
	computer_attempts += 1
	var result = ""
	
	$ComputerGuessLabel.text = BattleData.computer.name + " guessed: " + str(guess)
	
	is_guess_too_low = false
	is_guess_too_high = false
	
	if guess < player_number:
		result = "Too low!"
		$BattleStatusLabel.text = "Your turn"
		$ComputerResultLabel.text = "Computer guessed too low!"
		computer_min = guess + 1
		is_guess_too_low = true
	elif guess > player_number:
		result = "Too high!"
		$BattleStatusLabel.text = "Your turn"
		$ComputerResultLabel.text = "Computer guessed too high!"
		computer_max = guess - 1
		is_guess_too_high = true
	else:
		result = "Correct!"
		$BattleStatusLabel.text = "You lost"
		$ComputerResultLabel.text = "Computer won in " + str(computer_attempts) + " attempts!"
	
	# Add guess to history
	computer_guess_history.append({
		"guess": guess,
		"result": result
	})
	
	update_history_display()
	
	if guess == player_number:
		finish_game(player_number, BattleData.computer)


# Handle Computer Strategy Logic
func even_strategy() -> int:
	var possible_numbers = []
	for i in range(computer_min, computer_max + 1):
		if i not in computer_previous_guesses and i % 2 == 0:
			possible_numbers.append(i)
	
	if possible_numbers.size() > 0:
		last_guess = possible_numbers[randi() % possible_numbers.size()]
	else:
		# If no even options left, revert to any remaining number
		last_guess = computer_min + (computer_max - computer_min) / 2.0
	
	return last_guess


func uneven_strategy() -> int:
	var possible_numbers = []
	for i in range(computer_min, computer_max + 1):
		if i not in computer_previous_guesses and i % 2 == 1:
			possible_numbers.append(i)
	
	if possible_numbers.size() > 0:
		last_guess = possible_numbers[randi() % possible_numbers.size()]
	else:
		# If no odd options left, revert to any remaining number
		last_guess = computer_min + (computer_max - computer_min) / 2.0
	
	return last_guess


func half_guess() -> int:
	if last_guess == 0:
		# First guess: Start at half of MAX_NUMBER
		last_guess = ceil(float(GameData.MAX_NUMBER) / 2)
	else:
		# Adjust the range based on the previous guess feedback
		if is_guess_too_low:
			computer_min = last_guess + 1
		elif is_guess_too_high:
			computer_max = last_guess - 1

		# Recalculate half of the current search range based on the adjusted min-max range
		half_guess_difference = ceil(float(computer_max - computer_min) / 2)
		
		# Set the next guess to the midpoint of the updated range
		last_guess = computer_min + half_guess_difference
	
	# Clamp to ensure the guess is within bounds
	last_guess = clamp(last_guess, computer_min, computer_max)
	return last_guess


func smart_computer_guess() -> int:
	match BattleData.computer.computer_strategy:
		"even":
			return even_strategy()
		"uneven":
			return uneven_strategy()
		"half_guess":
			return half_guess()
		_:
			last_guess = randi() % (computer_max - computer_min + 1) + computer_min
			return last_guess


## Button
func _on_submit_button_pressed():
	if !game_active:
		print("Game is not active")
	elif is_player_turn:
		var guess = $GuessInput.text.to_int()
		if guess < 1 or guess > GameData.MAX_NUMBER:
			$PlayerResultLabel.text = "Please enter a number between 1 and %d." % GameData.MAX_NUMBER
			return
		check_guess(guess)
