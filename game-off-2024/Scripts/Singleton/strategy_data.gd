extends Node


func smart_computer_guess() -> int:
	match BattleData.computer.computer_strategy:
		"even":
			return even_strategy()
		"uneven":
			return uneven_strategy()
		"half_guess":
			return half_guess()
		_:
			print("Default")
			BattleData.last_guess = randi() % (BattleData.computer_max - BattleData.computer_min + 1) + BattleData.computer_min
			return BattleData.last_guess


# Handle Computer Strategy Logic
func even_strategy() -> int:
	print("Even Strategy")
	var possible_numbers = []
	for i in range(BattleData.computer_min, BattleData.computer_max + 1):
		if i not in BattleData.computer_previous_guesses and i % 2 == 0:
			possible_numbers.append(i)
	
	if possible_numbers.size() > 0:
		BattleData.last_guess = possible_numbers[randi() % possible_numbers.size()]
	else:
		# If no even options left, revert to any remaining number
		BattleData.last_guess = BattleData.computer_min + (BattleData.computer_max - BattleData.computer_min) / 2.0
	
	return BattleData.last_guess


func uneven_strategy() -> int:
	print("Uneven Strategy")
	var possible_numbers = []
	for i in range(BattleData.computer_min, BattleData.computer_max + 1):
		if i not in BattleData.computer_previous_guesses and i % 2 == 1:
			possible_numbers.append(i)
	
	if possible_numbers.size() > 0:
		BattleData.last_guess = possible_numbers[randi() % possible_numbers.size()]
	else:
		# If no odd options left, revert to any remaining number
		BattleData.last_guess = BattleData.computer_min + (BattleData.computer_max - BattleData.computer_min) / 2.0
	
	return BattleData.last_guess


func half_guess() -> int:
	print("Half Guess Strategy")
	if BattleData.last_guess == 0:
		# First guess: Start at half of MAX_NUMBER
		BattleData.last_guess = ceil(float(GameData.MAX_NUMBER) / 2)
	else:
		# Adjust the range based on the previous guess feedback
		if BattleData.is_guess_too_low:
			BattleData.computer_min = BattleData.last_guess + 1
		elif BattleData.is_guess_too_high:
			BattleData.computer_max = BattleData.last_guess - 1

		# Recalculate half of the current search range based on the adjusted min-max range
		BattleData.half_guess_difference = ceil(float(BattleData.computer_max - BattleData.computer_min) / 2)
		
		# Set the next guess to the midpoint of the updated range
		BattleData.last_guess = BattleData.computer_min + BattleData.half_guess_difference
	
	# Clamp to ensure the guess is within bounds
	BattleData.last_guess = clamp(BattleData.last_guess, BattleData.computer_min, BattleData.computer_max)
	return BattleData.last_guess
