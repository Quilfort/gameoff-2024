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

var penny = {
	"id": 5,
	"name": "Penny P",
	"computer_strategy": "default"
}

var david = {
	"id": 6,
	"name": "David D",
	"computer_strategy": "default"
}

var jeffrey = {
	"id": 7,
	"name": "Jeffrey J",
	"computer_strategy": "default"
}

var justin = {
	"id": 8,
	"name": "Justin J",
	"computer_strategy": "default"
}

var peter = {
	"id": 9,
	"name": "Peter P",
	"computer_strategy": "default"
}


# Function to dynamically return all computer data as a list
func get_all_computers():
	var computers = []
	for property in get_property_list():
		var computer = get(property.name)
		if typeof(computer) == TYPE_DICTIONARY:
				computers.append(computer)
	return computers
