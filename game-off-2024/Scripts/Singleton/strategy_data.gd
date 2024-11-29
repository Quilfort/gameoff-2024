extends Node

var prox_midpoint = 0

var strategies = [
	"even", 
	"uneven", 
	"half_guess", 
	"proximity_bias_strategy", 
	"range_split_strategy", 
	"preference_for_4_and_5_strategy", 
	"preference_for_1_and_6_strategy", 
	"pi_explorer_strategy", 
	"guess_within_player_range",
	]

func smart_computer_guess() -> int:

	var strategy = BattleData.computer.computer_strategy
	if strategy == "random":
		strategy = strategies[randi() % strategies.size()]
		
	match strategy:
		"even":
			return even_strategy()
		"uneven":
			return uneven_strategy()
		"half_guess":
			return half_guess()
		"proximity_bias_strategy":
			return proximity_bias_strategy()
		"range_split_strategy":
			return range_split_strategy()
		"preference_for_4_and_5_strategy":
			return preference_for_4_and_5_strategy()
		"preference_for_1_and_6_strategy()":
			return preference_for_1_and_6_strategy()	
		"pi_explorer_strategy":
			return pi_explorer_strategy()
		"guess_within_player_range":
			return guess_within_player_range()
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

func proximity_bias_strategy() -> int:
	print("Proximity Bias Strategy")
	# Calculate the midpoint of the valid range
	prox_midpoint = (BattleData.computer_min + BattleData.computer_max) / 2.0
	
	# Gather all valid unguessed numbers
	var possible_numbers = []
	for i in range(BattleData.computer_min, BattleData.computer_max + 1):
		if i not in BattleData.computer_previous_guesses:
			possible_numbers.append(i)
	
	if possible_numbers.size() > 0:
		# Sort numbers by proximity to the midpoint
		possible_numbers.sort_custom(_sort_by_proximity)
		BattleData.last_guess = possible_numbers[0]  # Closest to midpoint
	else:
		# Fallback to a random guess if all numbers have been guessed
		BattleData.last_guess = randi() % (BattleData.computer_max - BattleData.computer_min + 1) + BattleData.computer_min
	
	return BattleData.last_guess


# Helper function for custom sorting
func _sort_by_proximity(a: int, b: int) -> bool:
	# Compare numbers based on their absolute difference from the midpoint
	var diff_a = abs(a - prox_midpoint)
	var diff_b = abs(b - prox_midpoint)
	return diff_a < diff_b  # Return true if `a` should come before `b`

func range_split_strategy() -> int:
	print("Enhanced Range Split Strategy")
	# Gather all unguessed numbers
	var possible_numbers = []
	for i in range(BattleData.computer_min, BattleData.computer_max + 1):
		if i not in BattleData.computer_previous_guesses:
			possible_numbers.append(i)

	if possible_numbers.size() > 0:
		# Determine the smallest and largest unguessed numbers
		var smallest = possible_numbers[0]
		var largest = possible_numbers[possible_numbers.size() - 1]

		# Decide whether to alternate around the smallest or largest
		if randi() % 2 == 0:
			# Focus on the smallest and its extended range
			var max_for_small = min(smallest + 30, largest)
			BattleData.last_guess = randi() % (max_for_small - smallest + 1) + smallest
		else:
			# Focus on the largest and its extended range
			var min_for_large = max(largest - 30, smallest)
			BattleData.last_guess = randi() % (largest - min_for_large + 1) + min_for_large
	else:
		# Fallback to a random guess if no valid numbers remain
		BattleData.last_guess = randi() % (BattleData.computer_max - BattleData.computer_min + 1) + BattleData.computer_min

	return BattleData.last_guess

func preference_for_4_and_5_strategy() -> int:
	print("Preference for 4 and 5 Strategy")
	# Gather all unguessed numbers
	var possible_numbers = []
	for i in range(BattleData.computer_min, BattleData.computer_max + 1):
		if i not in BattleData.computer_previous_guesses:
			possible_numbers.append(i)
	
	# Filter numbers that contain 4 or 5 in their digits
	var preferred_numbers = []
	for num in possible_numbers:
		if str(num).find("4") != -1 or str(num).find("5") != -1:
			preferred_numbers.append(num)
	
	# If there are any preferred numbers, choose one at random
	if preferred_numbers.size() > 0:
		BattleData.last_guess = preferred_numbers[randi() % preferred_numbers.size()]
	else:
		# If no preferred numbers, fallback to a random guess
		BattleData.last_guess = randi() % (BattleData.computer_max - BattleData.computer_min + 1) + BattleData.computer_min
	
	return BattleData.last_guess

func preference_for_1_and_6_strategy() -> int:
	print("Preference for 1 and 6 Strategy")
	# Gather all unguessed numbers
	var possible_numbers = []
	for i in range(BattleData.computer_min, BattleData.computer_max + 1):
		if i not in BattleData.computer_previous_guesses:
			possible_numbers.append(i)
	
	# Filter numbers that contain 4 or 5 in their digits
	var preferred_numbers = []
	for num in possible_numbers:
		if str(num).find("1") != -1 or str(num).find("6") != -1:
			preferred_numbers.append(num)
	
	# If there are any preferred numbers, choose one at random
	if preferred_numbers.size() > 0:
		BattleData.last_guess = preferred_numbers[randi() % preferred_numbers.size()]
	else:
		# If no preferred numbers, fallback to a random guess
		BattleData.last_guess = randi() % (BattleData.computer_max - BattleData.computer_min + 1) + BattleData.computer_min
	
	return BattleData.last_guess

func pi_explorer_strategy() -> int:
	print("Pi Explorer Strategy")
	# Gather all unguessed numbers
	var possible_numbers = []
	for i in range(BattleData.computer_min, BattleData.computer_max + 1):
		if i not in BattleData.computer_previous_guesses:
			possible_numbers.append(i)
	
	# Calculate multiples of Pi (π) within the range
	var pi = 3.14159
	var closest_pi_multiple = 0
	var closest_distance = 1e10  # Use a large number as "infinity" substitute

	for i in range(BattleData.computer_min, BattleData.computer_max + 1):
		var multiple_of_pi = round(i / pi) * pi
		var distance = abs(multiple_of_pi - i)
		
		# Find the number closest to a multiple of Pi
		if distance < closest_distance:
			closest_pi_multiple = i
			closest_distance = distance
	
	# # Let the player know which number to avoid guessing
	# print("Avoid guessing the number:", closest_pi_multiple)
	
	# Set the guess to the closest multiple of Pi, if possible
	if closest_pi_multiple in possible_numbers:
		BattleData.last_guess = closest_pi_multiple
	else:
		# Default to a random guess if no suitable Pi multiple is found
		BattleData.last_guess = randi() % (BattleData.computer_max - BattleData.computer_min + 1) + BattleData.computer_min
	
	return BattleData.last_guess

func guess_within_player_range() -> int:
	print("Guess Within Range Strategy")
	
	# Check if the player's guess is 0 or the range is not possible
	if BattleData.player_guess == 0 or (BattleData.player_guess - 10 < BattleData.computer_min and BattleData.player_guess + 10 > BattleData.computer_max):
		# If the player's guess is 0 or the range is not possible, guess randomly
		BattleData.last_guess = randi() % (BattleData.computer_max - BattleData.computer_min + 1) + BattleData.computer_min
		print("Random Guess: ", BattleData.last_guess)
		return BattleData.last_guess

	# Calculate the valid range based on the player's guess
	var lower_bound = max(BattleData.computer_min, BattleData.player_guess - 10)
	var upper_bound = min(BattleData.computer_max, BattleData.player_guess + 10)

	# The computer guesses a random number within the valid range
	BattleData.last_guess = randi() % (upper_bound - lower_bound + 1) + lower_bound

	return BattleData.last_guess
