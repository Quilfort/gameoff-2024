extends Node

var comp1 = {
	"id": 1,
	"name": "Normal",
	"computer_strategy": "normal",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png"
}

var comp2 = {
	"id": 2,
	"name": "Uneven",
	"computer_strategy": "uneven",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png"
}

var comp3 = {
	"id": 3,
	"name": "Even",
	"computer_strategy": "even",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png"
}

var comp4 = {
	"id": 4,
	"name": "Half_Guess",
	"computer_strategy": "half_guess",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png"
}

var comp5 = {
	"id": 5,
	"name": "Penny P",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Penny/A_18_Avatar.png"
}

var comp6 = {
	"id": 6,
	"name": "David D",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png"
}

var comp7 = {
	"id": 7,
	"name": "Jeffrey J",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png"
}

var comp8 = {
	"id": 8,
	"name": "Justin J",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png"
}

var comp9 = {
	"id": 9,
	"name": "Peter P",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png"
}

var comp10 = {
	"id": 10,
	"name": "Peter P",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png"
}

var comp11 = {
	"id": 11,
	"name": "Peter P",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png"
}

var comp12 = {
	"id": 12,
	"name": "Peter P",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png"
}

var comp13 = {
	"id": 13,
	"name": "Peter P",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png"
}

var comp14 = {
	"id": 14,
	"name": "Peter P",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png"
}

var comp15 = {
	"id": 15,
	"name": "Peter P",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png"
}

var comp16 = {
	"id": 16,
	"name": "P16",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png"
}

var comp17 = {
	"id": 17,
	"name": "P17",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png"
}

var comp18 = {
	"id": 18,
	"name": "Comp18",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png"
}

var comp19 = {
	"id": 19,
	"name": "Comp19",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png"
}

var comp_tutorial = {
	"id": 20,
	"name": "Tutorial",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png"
}


# Function to dynamically return all computer data as a list
func get_all_computers():
	var computers = []
	for property in get_property_list():
		var computer = get(property.name)
		if typeof(computer) == TYPE_DICTIONARY:
				computers.append(computer)
	return computers
