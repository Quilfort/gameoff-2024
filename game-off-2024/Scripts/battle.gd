extends Node2D

# Variables to store the target numbers and attempts
var player_number = 0
var computer_number = 0
var player_attempts = 0
var computer_attempts = 0
var is_player_turn = true  # Track whose turn it is
var game_started = false    # Track if the game has started

# Called when the node enters the scene
func _ready():
	setup_game()  # Setup the game when ready

# Function to set up the game
func setup_game():
	computer_number = randi() % 10 + 1  # Generate a random number for the computer
	player_attempts = 0  # Reset player's attempts
	computer_attempts = 0  # Reset computer's attempts
	$InstructionLabel.text = "Set your number (1-10):"  # Prompt the player to set their number
	$PlayerResultLabel.text = ""  # Clear the result label
	$ComputerGuessLabel.text = "" 
	$ComputerResultLabel.text = "" 
	$GuessInput.clear()  # Clear the input field

# Function to check the player's guess
func check_guess(guess: int):
	if is_player_turn:
		player_attempts += 1
		# Compare the player's guess with the computer's number
		if guess < computer_number:
			$PlayerResultLabel.text = "Too low! Try again."
		elif guess > computer_number:
			$PlayerResultLabel.text = "Too high! Try again."
		else:
			$PlayerResultLabel.text = "Correct! You guessed it in " + str(player_attempts) + " attempts."
			is_player_turn = false  # Switch turn to computer
			computer_guesses()  # Trigger computer's guessing logic
	else:
		computer_guesses()  # Trigger computer's guessing logic

# Function for the computer to make a guess (you can improve this later)
func computer_guesses():
	# Simple logic for the computer to guess (you can make it more sophisticated)
	var guess = randi() % 10 + 1  # Random guess from 1 to 10
	computer_attempts += 1
	$ComputerGuessLabel.text = "Computer guessed: " + str(guess)
	print("Computer guessed: ", guess)  # For debugging purposes; remove in production

	if guess < player_number:
		$ComputerResultLabel.text = "Computer guessed too low!"
	elif guess > player_number:
		$ComputerResultLabel.text = "Computer guessed too high!"
	else:
		$ComputerResultLabel.text = "Computer guessed your number in " + str(computer_attempts) + " attempts!"
		#reset_game()

# Function to reset the game for a new round
func reset_game():
	setup_game()  # Reset the game settings and start again

# Function to handle the button press
func _on_submit_button_pressed():
	if !game_started:
		player_number = $GuessInput.text.to_int()
		if player_number < 1 or player_number > 10:
			$PlayerResultLabel.text = "Please enter a number between 1 and 10."
			return  
		$InstructionLabel.text = "Now guess the computer's number!"
		game_started = true
		if game_started:
			$GuessInput.clear()
	else:
		var guess = $GuessInput.text.to_int()  
		check_guess(guess)  
