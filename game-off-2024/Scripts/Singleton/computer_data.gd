extends Node

var comp1 = {
	"id": 1,
	"name": "Aiden Valor",
	"computer_strategy": "normal",
	"avatar_path": "res://Assets/Characters/Comp1/Comp1_Avatar.png",
	"character_path": "res://Assets/Characters/Comp1/Comp1.png",
	"before_battle_text": "I will fight with honor, as is the way of my clan!",
}

var comp2 = {
	"id": 2,
	"name": "Lyra Shadowsong",
	"computer_strategy": "uneven",
	"avatar_path": "res://Assets/Characters/Comp2/Comp2_Avatar.png",
	"character_path": "res://Assets/Characters/Comp2/Comp2.png",
	"before_battle_text": "The shadows guide my hand. You won’t see me coming.",
}

var comp3 = {
	"id": 3,
	"name": "Darius Ironfist",
	"computer_strategy": "even",
	"avatar_path": "res://Assets/Characters/Comp3/Comp3_Avatar.png",
	"character_path": "res://Assets/Characters/Comp3/Comp3.png",
	"before_battle_text": "Strength and steel will prevail. Let’s see if you’re worthy.",
}

var comp4 = {
	"id": 4,
	"name": "Evelyn Stormheart",
	"computer_strategy": "half_guess",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png",
	"character_path": "res://Assets/Characters/Comp4/Comp4.png",
	"before_battle_text": "The winds are at my back, and they whisper your defeat.",
}

var comp5 = {
	"id": 5,
	"name": "Penny Blackwater",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp5/Comp5_Avatar.png",
	"character_path": "res://Assets/Characters/Comp5/Comp5.png",
	"before_battle_text": "Hi, I’m Penny. Let’s have a good fight!",
}

var comp6 = {
	"id": 6,
	"name": "David Deepwood",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp6/Comp6_Avatar.png",
	"character_path": "res://Assets/Characters/Comp6/Comp6.png",
	"before_battle_text": "Through the forest and into the fray, my aim is true!",
}

var comp7 = {
	"id": 7,
	"name": "Jeffrey Ironblade",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp7/Comp7_Avatar.png",
	"character_path": "res://Assets/Characters/Comp7/Comp7.png",
	"before_battle_text": "A sharp blade and a sharp mind will win the day!",
}

var comp8 = {
	"id": 8,
	"name": "Justin Brightflame",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp8/Comp8_Avatar.png",
	"character_path": "res://Assets/Characters/Comp8/Comp8.png",
	"before_battle_text": "Feel the flames of my determination. Let’s battle!",
}

var comp9 = {
	"id": 9,
	"name": "Peter Grimshaw",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp9/Comp9_Avatar.png",
	"character_path": "res://Assets/Characters/Comp9/Comp9.png",
	"before_battle_text": "Darkness calls, and I shall answer. Prepare yourself!",
}

var comp10 = {
	"id": 10,
	"name": "Jace StreetWise",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp10/Comp10_Avatar.png",
	"character_path": "res://Assets/Characters/Comp10/Comp10.png",
	"before_battle_text": "Hi, I’m Jace. Try to keep up!",
}

var comp11 = {
	"id": 11,
	"name": "Amara Dawnlight",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp11/Comp11_Avatar.png",
	"character_path": "res://Assets/Characters/Comp11/Comp11.png",
	"before_battle_text": "The light of dawn shall shine on my victory!",
}

var comp12 = {
	"id": 12,
	"name": "Gareth Stonewall",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp12/Comp12_Avatar.png",
	"character_path": "res://Assets/Characters/Comp12/Comp12.png",
	"before_battle_text": "I am the immovable wall. Let’s see if you can break it.",
}

var comp13 = {
	"id": 13,
	"name": "Celeste Moonshadow",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp13/Comp13_Avatar.png",
	"character_path": "res://Assets/Characters/Comp13/Comp13.png",
	"before_battle_text": "The moon is my guide. Your end is nigh.",
}

var comp14 = {
	"id": 14,
	"name": "Roland Emberfall",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp14/Comp14_Avatar.png",
	"character_path": "res://Assets/Characters/Comp14/Comp14.png",
	"before_battle_text": "Fire and fury shall lead me to victory!",
}

var comp15 = {
	"id": 15,
	"name": "Mira Silverwind",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp15/Comp15_Avatar.png",
	"character_path": "res://Assets/Characters/Comp15/Comp15.png",
	"before_battle_text": "I’m swift as the wind. You won’t even see me coming.",
}

var comp16 = {
	"id": 16,
	"name": "Elric Frostbane",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp16/Comp16_Avatar.png",
	"character_path": "res://Assets/Characters/Comp16/Comp16.png",
	"before_battle_text": "The cold will freeze your courage. Prepare yourself!",
}

var comp17 = {
	"id": 17,
	"name": "Luna Nightshade",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp17/Comp17_Avatar.png",
	"character_path": "res://Assets/Characters/Comp17/Comp17.png",
	"before_battle_text": "In the shadow of the night, I’ll claim victory.",
}

var comp18 = {
	"id": 18,
	"name": "Vance Goldmane",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp18/Comp18_Avatar.png",
	"character_path": "res://Assets/Characters/Comp18/Comp18.png",
	"before_battle_text": "The battlefield is my domain. Let’s make this quick.",
}

var comp19 = {
	"id": 19,
	"name": "Sylvia Brightleaf",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp19/Comp19_Avatar.png",
	"character_path": "res://Assets/Characters/Comp19/Comp19.png",
	"before_battle_text": "Nature fights with me. Let’s see if you can stand against it.",
}

var comp_tutorial = {
	"id": 20,
	"name": "Arin Sagewood",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/CompTutorial/CompTutorial_Avatar.png",
	"character_path": "res://Assets/Characters/CompTutorial/CompTutorial.png",
	"before_battle_text": "I’ll show you the ropes. Let’s start with the basics.",
}


func get_all_computers():
	var computers = []
	for property in get_property_list():
		var computer = get(property.name)
		if typeof(computer) == TYPE_DICTIONARY and computer.id != 20:
			computers.append(computer)
	return computers
