extends Node

var normal = {
	"id": 1,
	"name": "Normal",
	"computer_strategy": "normal"
}

var uneven = {
	"id": 2,
	"name": "Uneven",
	"computer_strategy": "uneven"
}

var even = {
	"id": 3,
	"name": "Even",
	"computer_strategy": "even"
}

var half_guess = {
	"id": 4,
	"name": "Half_Guess",
	"computer_strategy": "half_guess"
}

# Function to return all computer data as a list
# Function to dynamically return all computer data as a list
func get_all_computers():
	var computers = []
	for property in get_property_list():
		var computer = get(property.name)
		if typeof(computer) == TYPE_DICTIONARY:
				computers.append(computer)
		#if property.name.begins_with("computer_"):  
			#var computer = get(property.name)
			#if typeof(computer) == TYPE_DICTIONARY:  # Ensure it's a dictionary before adding
				#computers.append(computer)
	return computers
