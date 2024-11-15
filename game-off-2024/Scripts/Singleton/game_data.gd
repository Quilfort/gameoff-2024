extends Node

#Settings
var MAX_NUMBER = 10
# Should always be a power of 2 (2, 4, 8, 16 etc.)
var MAX_PLAYERS = 8

# Tournament
var DRAFT_COMPLETED = false
var tournament_matches = []
var next_matches = []
var tournament_champion = null
