extends Node2D

# Variables to store the target number and number of attempts
var target_number = 0
var attempts = 0

# Called when the node enters the scene
func _ready():
	generate_number()  # Initialize the game with a random number

# Function to generate a new random number between 1 and 10
func generate_number():
	target_number = randi() % 10 + 1
	attempts = 0
	$InstructionLabel.text = "Guess the number between 1 and 10."  # Reset the instruction label
	$ResultLabel.text = ""  # Clear the result label

# Function to check the player's guess
func check_guess():
	var guess = $GuessInput.text.to_int()  # Convert input to integer
	attempts += 1

	# Compare the guess with the target number
	if guess < target_number:
		$ResultLabel.text = "Too low! Try again."
	elif guess > target_number:
		$ResultLabel.text = "Too high! Try again."
	else:
		$ResultLabel.text = "Correct! You guessed it in " + str(attempts) + " attempts."

	$GuessInput.clear()  # Clear the input field for the next guess

func _on_submit_button_pressed() -> void:
	check_guess() 
