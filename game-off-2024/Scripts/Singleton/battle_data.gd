extends Node

# Battle Settings
var battle_active = false

# Player Information
var player_number = 0
var player_attempts = 0

# Computer Information
var computer = null

# Battle History
var battle_history = []
var battle_winners = []

# Ugly Battle Variables / Refactor later
var computer_min = 0
var computer_max = 0
var last_guess = 0
var half_guess_difference = 0
var is_guess_too_low = false
var is_guess_too_high = false

# Computer Strategy
var computer_previous_guesses = []
var computer_number = 0
var player_guess = 0
