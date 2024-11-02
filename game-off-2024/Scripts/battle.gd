extends Node2D

# Game configuration
var MAX_NUMBER = BattleData.MAX_NUMBER

# Variables to store the target numbers and attempts
var player_number = BattleData.player_number
var computer_number = 0
var player_attempts = 0
var computer_attempts = 0
var is_player_turn = false  
var game_started = BattleData.game_started    
var computer_timer = 0     
var computer_delay = 2.0 

# Variables for smart computer guessing
var computer_min = 1
var computer_max = MAX_NUMBER
var computer_previous_guesses = []

# Variables for storing guess history
var player_guess_history = []
var computer_guess_history = []

func _ready():
	setup_game()

func _process(delta):
	if game_started and !is_player_turn:
		computer_timer += delta
		if computer_timer >= computer_delay:
			computer_timer = 0
			computer_guesses()
			is_player_turn = true
			$InstructionLabel.text = "Your turn! Make a guess (1-%d):" % MAX_NUMBER

func setup_game():
	computer_number = randi() % MAX_NUMBER + 1
	player_attempts = 0
	computer_attempts = 0
	computer_timer = 0
	computer_min = 1
	computer_max = MAX_NUMBER
	computer_previous_guesses.clear()
	player_guess_history.clear()
	computer_guess_history.clear()
	
	$InstructionLabel.text = ""
	$PlayerResultLabel.text = ""
	$ComputerGuessLabel.text = ""
	$ComputerResultLabel.text = ""
	$BattleStatusLabel.text = ""
	$PlayerHistoryLabel.text = ""
	$ComputerHistoryLabel.text = ""
	$GuessInput.clear()
	which_player_starts()
	
	
func which_player_starts():

	# Random select Player
	is_player_turn = randi() % 2 == 0
	
	# Update Battle Status Label based on who starts
	if is_player_turn:
		$BattleStatusLabel.text = "You start! Make a guess."
		$InstructionLabel.text = "Your turn! Make a guess (1-%d):" % MAX_NUMBER
	else:
		$BattleStatusLabel.text = "Computer starts guessing..."
		$InstructionLabel.text = "Computer will guess in 2 seconds..."
		await get_tree().create_timer(2.0).timeout



func update_history_display():
	var player_history_text = "Player Guesses:\n"
	for guess_info in player_guess_history:
		player_history_text += str(guess_info.guess) + " - " + guess_info.result + "\n"
	
	$PlayerHistoryLabel.text = player_history_text  # Update the player history label

	var computer_history_text = "Computer Guesses:\n"
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
		$BattleStatusLabel.text = "Wait for computer's turn..."
		$PlayerResultLabel.text = result
	elif guess > computer_number:
		result = "Too high!"
		$BattleStatusLabel.text = "Wait for computer's turn..."
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
		await get_tree().create_timer(5.0).timeout
		get_tree().change_scene_to_file("res://Scenes/before_battle.tscn")
		return
		
	is_player_turn = false 
	$InstructionLabel.text = "Computer will guess in 2 seconds..."
	$GuessInput.clear()

func smart_computer_guess() -> int:
	var possible_numbers = []
	for i in range(computer_min, computer_max + 1):
		if i not in computer_previous_guesses:
			possible_numbers.append(i)
	
	if possible_numbers.size() > 0:
		return possible_numbers[randi() % possible_numbers.size()]
	
	return computer_min + (computer_max - computer_min) / 2

func computer_guesses():
	var guess = smart_computer_guess()
	computer_previous_guesses.append(guess)
	computer_attempts += 1
	var result = ""
	
	$ComputerGuessLabel.text = "Computer guessed: " + str(guess)
	
	if guess < player_number:
		result = "Too low!"
		$BattleStatusLabel.text = "Your turn"
		$ComputerResultLabel.text = "Computer guessed too low!"
		computer_min = guess + 1
	elif guess > player_number:
		result = "Too high!"
		$BattleStatusLabel.text = "Your turn"
		$ComputerResultLabel.text = "Computer guessed too high!"
		computer_max = guess - 1
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
		await get_tree().create_timer(5.0).timeout
		get_tree().change_scene_to_file("res://Scenes/before_battle.tscn")
		return

func reset_game():
	setup_game()


func _on_submit_button_pressed():
	if !game_started:
		print("NOT STARTED")
	elif is_player_turn:
		var guess = $GuessInput.text.to_int()
		if guess < 1 or guess > MAX_NUMBER:
			$PlayerResultLabel.text = "Please enter a number between 1 and %d." % MAX_NUMBER
			return
		check_guess(guess)

		
