extends Node

var comp1 = {
	"id": 1,
	"name": "Aiden Valor",
	"computer_strategy": "normal",
	"avatar_path": "res://Assets/Characters/Comp1/Comp1_Avatar.png",
	"character_path": "res://Assets/Characters/Comp1/Comp1.png",
	"before_battle_text": "I will fight with honor, as is the way of my clan!",
	"battle_text": "I'll show you the true power of my blade!",
	"victory_text": "Victory is mine! I fought with honor and won!",
	"defeat_text": "You fought well. I shall train harder for our next battle.",
	"champion_text": "I am the champion! Nobody can touch me!"
}

var comp2 = {
	"id": 2,
	"name": "Lyra Shadowsong",
	"computer_strategy": "uneven",
	"avatar_path": "res://Assets/Characters/Comp2/Comp2_Avatar.png",
	"character_path": "res://Assets/Characters/Comp2/Comp2.png",
	"before_battle_text": "The shadows guide my hand. You won’t see me coming.",
	"battle_text": "I strike from the darkness—your end is near!",
	"victory_text": "The shadows never fail. Another victory for me.",
	"defeat_text": "The light pierced my defenses... but I’ll return stronger.",
	"champion_text": "I am the shadow's chosen champion. None can oppose me!"
}

var comp3 = {
	"id": 3,
	"name": "Darius Ironfist",
	"computer_strategy": "even",
	"avatar_path": "res://Assets/Characters/Comp3/Comp3_Avatar.png",
	"character_path": "res://Assets/Characters/Comp3/Comp3.png",
	"before_battle_text": "Strength and steel will prevail. Let’s see if you’re worthy.",
	"battle_text": "Feel the strength of my unbreakable resolve!",
	"victory_text": "Another foe crushed beneath the weight of my power!",
	"defeat_text": "Your strength surpasses mine, but I’ll forge myself anew.",
	"champion_text": "I am the iron wall that stands undefeated. Bow before me!"
}

var comp4 = {
	"id": 4,
	"name": "Evelyn Stormheart",
	"computer_strategy": "half_guess",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png",
	"character_path": "res://Assets/Characters/Comp4/Comp4.png",
	"before_battle_text": "The winds are at my back, and they whisper your defeat.",
	"battle_text": "The storm rises, and you shall be swept away!",
	"victory_text": "The winds of fate favored me today!",
	"defeat_text": "Even the storm must bow before true strength. Well done.",
	"champion_text": "I am the tempest's might. None can weather my fury!"
}

var comp5 = {
	"id": 5,
	"name": "Penny Blackwater",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp5/Comp5_Avatar.png",
	"character_path": "res://Assets/Characters/Comp5/Comp5.png",
	"before_battle_text": "Hi, I’m Penny. Let’s have a good fight!",
	"battle_text": "Let’s make this fun! Show me what you’ve got!",
	"victory_text": "That was exciting! I can’t wait for the next match!",
	"defeat_text": "You’ve got me this time, but I’ll be back for more!",
	"champion_text": "Champion of the people, and still ready for more battles!"
}

var comp6 = {
	"id": 6,
	"name": "David Deepwood",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp6/Comp6_Avatar.png",
	"character_path": "res://Assets/Characters/Comp6/Comp6.png",
	"before_battle_text": "Through the forest and into the fray, my aim is true!",
	"battle_text": "The forest whispers your downfall—prepare yourself!",
	"victory_text": "Nature never fails. Another victory for the woods.",
	"defeat_text": "The forest mourns my loss... but it will guide me again.",
	"champion_text": "I am the forest’s might. None can match me!"
}

var comp7 = {
	"id": 7,
	"name": "Jeffrey Ironblade",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp7/Comp7_Avatar.png",
	"character_path": "res://Assets/Characters/Comp7/Comp7.png",
	"before_battle_text": "A sharp blade and a sharp mind will win the day!",
	"battle_text": "Prepare to feel the precision of my strikes!",
	"victory_text": "A calculated victory. Exactly as I planned!",
	"defeat_text": "You outwitted me this time, but I’ll be ready next round.",
	"champion_text": "Champion through skill and strategy. I reign supreme!"
}

var comp8 = {
	"id": 8,
	"name": "Seraphina Moonfire",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp8/Comp8_Avatar.png",
	"character_path": "res://Assets/Characters/Comp8/Comp8.png",
	"before_battle_text": "The stars have aligned for this battle. Let us begin!",
	"battle_text": "I shall harness the heavens to defeat you!",
	"victory_text": "The stars guided me to victory, as they always do.",
	"defeat_text": "The constellations failed me this time, but I will rise again.",
	"champion_text": "The cosmos bows to me! I am the celestial champion!"
}

var comp9 = {
	"id": 9,
	"name": "Garrick Stonebreaker",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp9/Comp9_Avatar.png",
	"character_path": "res://Assets/Characters/Comp9/Comp9.png",
	"before_battle_text": "A warrior’s resolve is unyielding. Prepare yourself.",
	"battle_text": "Feel the crushing weight of my hammer!",
	"victory_text": "Another foe smashed! None can break the Stonebreaker.",
	"defeat_text": "You were stronger today, but I shall return with greater force.",
	"champion_text": "I am the champion, as unbreakable as stone itself!"
}

var comp10 = {
	"id": 10,
	"name": "Kael Sunflare",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp10/Comp10_Avatar.png",
	"character_path": "res://Assets/Characters/Comp10/Comp10.png",
	"before_battle_text": "The flames of destiny burn within me. Let’s fight!",
	"battle_text": "Burn brightly or burn out—let’s see your choice!",
	"victory_text": "Another victory to stoke the eternal flames!",
	"defeat_text": "The fire flickers, but it will never die. I’ll return.",
	"champion_text": "I am the eternal flame, and none can extinguish my glory!"
}

var comp11 = {
	"id": 11,
	"name": "Freya Dawnseeker",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp11/Comp11_Avatar.png",
	"character_path": "res://Assets/Characters/Comp11/Comp11.png",
	"before_battle_text": "The light shall guide me to victory. Let’s begin.",
	"battle_text": "Behold the radiant power of my resolve!",
	"victory_text": "Victory shines brightly in my hands!",
	"defeat_text": "Your strength eclipsed mine today, but dawn always returns.",
	"champion_text": "The light crowns me as the true champion of this realm!"
}

var comp12 = {
	"id": 12,
	"name": "Magnus Thunderforge",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp12/Comp12_Avatar.png",
	"character_path": "res://Assets/Characters/Comp12/Comp12.png",
	"before_battle_text": "The thunder roars in my veins. Prepare to be struck down!",
	"battle_text": "Feel the might of the storm as it crashes upon you!",
	"victory_text": "The storm has spoken, and it declares my triumph!",
	"defeat_text": "The storm subsides, but I will return stronger than ever.",
	"champion_text": "I am the storm incarnate. No one can stand against my thunder!"
}

var comp13 = {
	"id": 13,
	"name": "Celeste Frostbane",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp13/Comp13_Avatar.png",
	"character_path": "res://Assets/Characters/Comp13/Comp13.png",
	"before_battle_text": "The cold will claim you. Are you prepared to freeze?",
	"battle_text": "Feel the bite of winter’s wrath!",
	"victory_text": "Another foe frozen in defeat. Victory is mine!",
	"defeat_text": "The ice has cracked... but I will return unbroken.",
	"champion_text": "The frost crowns me as the unyielding champion!"
}

var comp14 = {
	"id": 14,
	"name": "Thalric Ironbrow",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp14/Comp14_Avatar.png",
	"character_path": "res://Assets/Characters/Comp14/Comp14.png",
	"before_battle_text": "You face a mountain of will. Prepare for the climb.",
	"battle_text": "My strength is unshakable—let’s see yours!",
	"victory_text": "Another step to the summit. Victory is mine!",
	"defeat_text": "You bested me today, but mountains never crumble easily.",
	"champion_text": "I am the immovable force, the champion of all!"
}

var comp15 = {
	"id": 15,
	"name": "Liora Starfall",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp15/Comp15_Avatar.png",
	"character_path": "res://Assets/Characters/Comp15/Comp15.png",
	"before_battle_text": "The heavens watch over me. Let’s see if they favor you.",
	"battle_text": "Witness the celestial might of the stars!",
	"victory_text": "The heavens smiled upon me today. Victory is mine!",
	"defeat_text": "The stars dimmed, but their light will guide me back.",
	"champion_text": "I am the chosen of the stars, the eternal champion!"
}

var comp16 = {
	"id": 16,
	"name": "Valeria Nightshade",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp16/Comp16_Avatar.png",
	"character_path": "res://Assets/Characters/Comp16/Comp16.png",
	"before_battle_text": "The shadows whisper your defeat. Let us begin.",
	"battle_text": "Embrace the darkness; it is your only refuge now.",
	"victory_text": "Another falls to the shadows. Victory is mine.",
	"defeat_text": "Even in defeat, the night conceals my next move.",
	"champion_text": "I am the queen of shadows, the eternal champion of the night!"
}

var comp17 = {
	"id": 17,
	"name": "Eryndor Flamescar",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp17/Comp17_Avatar.png",
	"character_path": "res://Assets/Characters/Comp17/Comp17.png",
	"before_battle_text": "The fury of the inferno awaits you. Shall we dance?",
	"battle_text": "Feel the searing blaze of my wrath!",
	"victory_text": "Ashes to ashes, I stand victorious!",
	"defeat_text": "Even flames can falter, but I will return brighter!",
	"champion_text": "The inferno crowns me as its rightful champion!"
}

var comp18 = {
	"id": 18,
	"name": "Alyndra Windwhisper",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp18/Comp18_Avatar.png",
	"character_path": "res://Assets/Characters/Comp18/Comp18.png",
	"before_battle_text": "The winds carry tidings of your doom. Let’s begin.",
	"battle_text": "Feel the slicing gale of my fury!",
	"victory_text": "The winds have spoken, and they declare my triumph!",
	"defeat_text": "The breeze has turned, but I’ll soar again.",
	"champion_text": "The winds sing my name as the true champion!"
}

var comp19 = {
	"id": 19,
	"name": "Darius Stormclaw",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp19/Comp19_Avatar.png",
	"character_path": "res://Assets/Characters/Comp19/Comp19.png",
	"before_battle_text": "The storm gathers, and it hungers for victory. Let’s clash!",
	"battle_text": "The storm is upon you—prepare to be swept away!",
	"victory_text": "Thunder roars in triumph! Another victory is mine.",
	"defeat_text": "The storm falters, but it always returns stronger.",
	"champion_text": "I am the tempest incarnate, the champion of all storms!"
}

var comp_tutorial = {
	"id": 20,
	"name": "Arin Sagewood",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/CompTutorial/CompTutorial_Avatar.png",
	"character_path": "res://Assets/Characters/CompTutorial/CompTutorial.png",
	"before_battle_text": "I’ll show you the ropes. Let’s start with the basics.",
	"battle_text": "The veil lifts, and the moon’s wrath descends!",
	"victory_text": "The moonlight shines brightest upon my victory!",
	"defeat_text": "The moon wanes, but it always returns to its full glory.",
	"champion_text": "The moon crowns me its eternal champion!"
}


func get_all_computers():
	var computers = []
	for property in get_property_list():
		var computer = get(property.name)
		if typeof(computer) == TYPE_DICTIONARY and computer.id != 20:
			computers.append(computer)
	return computers
