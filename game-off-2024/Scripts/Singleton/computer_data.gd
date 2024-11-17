extends Node

var normal = {
	"id": 1,
	"name": "Normal",
	"computer_strategy": "normal",
	"avatar_path": "res://Assets/Characters/Penny/A_18_Avatar.png"
}

var uneven = {
	"id": 2,
	"name": "Uneven",
	"computer_strategy": "uneven",
	"avatar_path": "res://Assets/Characters/Half_Guess/A_16_Avatar.png"
}

var even = {
	"id": 3,
	"name": "Even",
	"computer_strategy": "even",
	"avatar_path": "res://Assets/Characters/Even/A_2_Avatar.png"
}

var half_guess = {
	"id": 4,
	"name": "Half_Guess",
	"computer_strategy": "half_guess",
	"avatar_path": "res://Assets/Characters/Half_Guess/A_16_Avatar.png"
}

var penny = {
	"id": 5,
	"name": "Penny P",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Penny/A_18_Avatar.png"
}

var david = {
	"id": 6,
	"name": "David D",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Even/A_2_Avatar.png"
}

var jeffrey = {
	"id": 7,
	"name": "Jeffrey J",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Penny/A_18_Avatar.png"
}

var justin = {
	"id": 8,
	"name": "Justin J",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Even/A_2_Avatar.png"
}

var peter = {
	"id": 9,
	"name": "Peter P",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Half_Guess/A_16_Avatar.png"
}


# Function to dynamically return all computer data as a list
func get_all_computers():
	var computers = []
	for property in get_property_list():
		var computer = get(property.name)
		if typeof(computer) == TYPE_DICTIONARY:
				computers.append(computer)
	return computers
