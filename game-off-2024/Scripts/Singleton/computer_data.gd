extends Node

var comp1 = {
	"id": 1,
	"name": "Celeste Ardyn",
	"computer_strategy": "normal",
	"avatar_path": "res://Assets/Characters/Comp1/Comp1_Avatar.png",
	"character_path": "res://Assets/Characters/Comp1/Comp1.png",
	"before_battle_text": "The throne is mine by right. Do you dare defy me?",
	"battle_text": "Kneel before your queen, or be crushed under my will!",
	"initiative_win_text": "Your hesitation is your undoing. I lead this dance!",
	"initiative_lose_text": "A bold move... but I will still prevail!",
	"victory_text": "Fate favors me, as it always should. Another step closer to my destiny!",
	"defeat_text": "You may have won, but this is far from over. Remember my name!",
	"champion_text": "Bow down! I am the rightful ruler, and this proves it!"
}

var comp2 = {
	"id": 2,
	"name": "Ravyn Thorn",
	"computer_strategy": "uneven",
	"avatar_path": "res://Assets/Characters/Comp2/Comp2_Avatar.png",
	"character_path": "res://Assets/Characters/Comp2/Comp2.png",
	"before_battle_text": "Oh, darling, are you sure you're ready to dance with a demon?",
	"battle_text": "Let me show you a performance you'll never forget.",
	"initiative_win_text": "How thrilling! I take the lead in this deadly waltz.",
	"initiative_lose_text": "You’re bold—I like that. Let’s make this interesting.",
	"victory_text": "Such sweet surrender... You didn’t stand a chance, love.",
	"defeat_text": "You win this time. Here, take my rose as a token... for now.",
	"champion_text": "The whispers were right—I’m irresistible even in victory!"
}

var comp3 = {
	"id": 3,
	"name": "Kaia Solis",
	"computer_strategy": "even",
	"avatar_path": "res://Assets/Characters/Comp3/Comp3_Avatar.png",
	"character_path": "res://Assets/Characters/Comp3/Comp3.png",
	"before_battle_text": "This is going to be so much fun! Let’s do our best, okay?",
	"battle_text": "Alright, time to show you why I carry this tube everywhere!",
	"initiative_win_text": "Yay! I get to go first. Let's make this count!",
	"initiative_lose_text": "Your turn first? Okay, I’ll learn from watching you!",
	"victory_text": "Wow, I actually won! That was amazing—you’re really good!",
	"defeat_text": "You were incredible! I’ve got so much to learn... but I’ll get better!",
	"champion_text": "Champion? Me? Oh wow! I just wanted to have fun!"
}

var comp4 = {
	"id": 4,
	"name": "Peter Duskbane",
	"computer_strategy": "half_guess",
	"avatar_path": "res://Assets/Characters/Comp4/Comp4_Avatar.png",
	"character_path": "res://Assets/Characters/Comp4/Comp4.png",
	"before_battle_text": "Humanity has held the throne for too long. I will correct this injustice.",
	"battle_text": "Your end is inevitable. Bow to the rightful ruler.",
	"initiative_win_text": "As expected. I claim the first move.",
	"initiative_lose_text": "It matters not. Your efforts are meaningless.",
	"victory_text": "Another step closer to reclaiming the throne for my kind.",
	"defeat_text": "You have delayed the inevitable. Humanity's reign will end.",
	"champion_text": "The throne is mine, as it was always destined to be."
}

var comp5 = {
	"id": 5,
	"name": "Penny Blackwater",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp5/Comp5_Avatar.png",
	"character_path": "res://Assets/Characters/Comp5/Comp5.png",
	"before_battle_text": "Hi there! Oh wait... is this where the fight is? Yay!",
	"battle_text": "Ooh, is this part of the game? Let’s have fun!",
	"initiative_win_text": "I get to go first? Oh wow, what do I do now?",
	"initiative_lose_text": "Oh, you’re going first? Okay! I'll just watch and learn.",
	"victory_text": "Yay, I won! Wait... what did I win again?",
	"defeat_text": "That was so much fun! Can we have snacks now?",
	"champion_text": "Me? A champion? Oh, this is so exciting! Do I get cake?"
}

var comp6 = {
	"id": 6,
	"name": "David Shadowthorn",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp6/Comp6_Avatar.png",
	"character_path": "res://Assets/Characters/Comp6/Comp6.png",
	"before_battle_text": "Silent steps. Sharp blade. Your time ends here.",
	"battle_text": "No more shadows. I’ll claim the throne in the open.",
	"initiative_win_text": "I move first. Your fate is sealed.",
	"initiative_lose_text": "A delay, nothing more. You cannot escape.",
	"victory_text": "The best remain standing. You were never a match.",
	"defeat_text": "Even the best stumble... but shadows always return.",
	"champion_text": "The throne is mine. I no longer hide in the shadows."
}

var comp7 = {
	"id": 7,
	"name": "Elara Dawnlight",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp7/Comp7_Avatar.png",
	"character_path": "res://Assets/Characters/Comp7/Comp7.png",
	"before_battle_text": "I fight not for myself, but for a world united in peace.",
	"battle_text": "Together, we can make this world better. But I won’t hold back!",
	"initiative_win_text": "The light guides me first. Let us see where it takes us.",
	"initiative_lose_text": "You move first. May your actions reflect wisdom.",
	"victory_text": "This victory is for everyone, no matter their kind.",
	"defeat_text": "Please, use your power wisely. The world depends on it.",
	"champion_text": "A united world starts here. Let us walk this path together."
}

var comp8 = {
	"id": 8,
	"name": "Serah Dawnlight",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp8/Comp8_Avatar.png",
	"character_path": "res://Assets/Characters/Comp8/Comp8.png",
	"before_battle_text": "My sister Elara may fight for peace, but I fight for power. Let’s see who truly deserves the throne.",
	"battle_text": "I will conquer the stars themselves to claim what is mine!",
	"initiative_win_text": "The power of the stars is mine to command! I strike first!",
	"initiative_lose_text": "You may have the first move, but I will take control soon enough!",
	"victory_text": "Victory is mine! Power is the only truth.",
	"defeat_text": "The stars turned their back on me this time... but I’ll take what is mine eventually.",
	"champion_text": "I am the one who will rule, with power beyond the stars!"
}

var comp9 = {
	"id": 9,
	"name": "Lilith Inferno",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp9/Comp9_Avatar.png",
	"character_path": "res://Assets/Characters/Comp9/Comp9.png",
	"before_battle_text": "Underestimate me, and you will regret it. I will set this world ablaze!",
	"battle_text": "Feel the flames of hell—there's no escape!",
	"initiative_win_text": "The flames favor me! I strike first and burn you to the ground!",
	"initiative_lose_text": "You may have the first strike, but it won't save you from the inferno that’s coming!",
	"victory_text": "I told you. The world will burn, and I will reign.",
	"defeat_text": "You may have won this time, but next time, the fires of hell will consume you.",
	"champion_text": "I am the queen of devils! Let the world burn in my name!",

}

var comp10 = {
	"id": 10,
	"name": "Kael Ardyn",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp10/Comp10_Avatar.png",
	"character_path": "res://Assets/Characters/Comp10/Comp10.png",
	"before_battle_text": "The flames of destiny burn within me. Let’s fight!",
	"battle_text": "Burn brightly or burn out—let’s see your choice!",
	"initiative_win_text": "I am the chosen one, the flames are mine to command!",
	"initiative_lose_text": "It matters not, I’ll rise and burn brighter next time!",
	"victory_text": "Another victory to stoke the eternal flames!",
	"defeat_text": "The fire flickers, but it will never die. I’ll return.",
	"champion_text": "I am the eternal flame, and none can extinguish my glory!"
}

var comp11 = {
	"id": 11,
	"name": "Freya Shadowthorn",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp11/Comp11_Avatar.png",
	"character_path": "res://Assets/Characters/Comp11/Comp11.png",
	"before_battle_text": "The light shall guide me to victory. Let’s begin.",
	"battle_text": "Behold the radiant power of my resolve!",
	"initiative_win_text": "The light is with me. I can feel it guiding my every move!",
	"initiative_lose_text": "It’s just a momentary setback. I’ll find my way to victory!",
	"victory_text": "Victory shines brightly in my hands!",
	"defeat_text": "Your strength eclipsed mine today, but dawn always returns.",
	"champion_text": "I am the champion... but the throne belongs to my brother, David. He will rule, and I’ll find peace."
}

var comp12 = {
	"id": 12,
	"name": "Zephyr Windlord",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp12/Comp12_Avatar.png",
	"character_path": "res://Assets/Characters/Comp12/Comp12.png",
	"before_battle_text": "The wind whispers of victory. Prepare yourself!",
	"battle_text": "Feel the breeze of my power as it sweeps you away!",
	"initiative_win_text": "The winds favor me. You cannot escape my reach.",
	"initiative_lose_text": "The wind shifts, but I will find my way again.",
	"victory_text": "The storm has spoken, and it declares my triumph!",
	"defeat_text": "The wind subsides, but I will return stronger than ever.",
	"champion_text": "I am the storm incarnate. No one can stand against my thunder!"
}

var comp13 = {
	"id": 13,
	"name": "Sylva Greenhart",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp13/Comp13_Avatar.png",
	"character_path": "res://Assets/Characters/Comp13/Comp13.png",
	"before_battle_text": "I am the shield of nature, and nature’s wrath is cold as ice. Prepare yourself!",
	"battle_text": "The forest is my armor, the winter my sword. Face the storm of nature!",
	"initiative_win_text": "You may have won the first move, but nature always strikes last.",
	"initiative_lose_text": "The winds of nature may bend, but they do not break. I will not fall easily.",
	"victory_text": "Another enemy frozen by nature’s might. The forest shields me once more!",
	"defeat_text": "The chill may fade... but I am the shield of nature, and I will rise again.",
	"champion_text": "I am the guardian of the woods, the frost shall crown me the eternal shield of nature!"
}

var comp14 = {
   "id": 14,
   "name": "Thalric Greenhart",
   "computer_strategy": "default",
   "avatar_path": "res://Assets/Characters/Comp14/Comp14_Avatar.png",
   "character_path": "res://Assets/Characters/Comp14/Comp14.png",
   "before_battle_text": "My bird brain is ready to soar. Prepare to face the wind’s fury!",
   "battle_text": "The woods are my domain, and you’ll feel every leaf in your path!",
   "initiative_win_text": "You might think you can fly, but I’ve got the winds on my side!",
   "initiative_lose_text": "Don’t think for a second you’ve outflown me… I’ll rise again!",
   "victory_text": "The woods cheer my victory—this throne is mine to protect!",
   "defeat_text": "A bird can fall, but the forest always picks itself up. I’ll be back!",
   "champion_text": "I am the king of the woods, the heart of nature’s might!"
}

var comp15 = {
   "id": 15,
   "name": "Zelora Dawncrest",
   "computer_strategy": "default",
   "avatar_path": "res://Assets/Characters/Comp15/Comp15_Avatar.png",
   "character_path": "res://Assets/Characters/Comp15/Comp15.png",
   "before_battle_text": "The stars above guide my every step, and they will not falter now.",
   "battle_text": "Prepare yourself—my light will pierce through the darkness!",
   "initiative_win_text": "The heavens have spoken in my favor. I shall lead the way!",
   "initiative_lose_text": "The stars may flicker, but their path will always return to me.",
   "victory_text": "The light of the stars shines bright. Victory is mine!",
   "defeat_text": "The night may have won, but the dawn always rises again.",
   "champion_text": "I am the chosen of the stars, the celestial champion of light!"
}

var comp16 = {
   "id": 16,
   "name": "Draegon Darkbane",
   "computer_strategy": "default",
   "avatar_path": "res://Assets/Characters/Comp16/Comp16_Avatar.png",
   "character_path": "res://Assets/Characters/Comp16/Comp16.png",
   "before_battle_text": "Your fear echoes through the abyss. It will consume you.",
   "battle_text": "Feel the weight of the demon's curse—your doom is inevitable.",
   "initiative_win_text": "I strike first, and your fate is sealed.",
   "initiative_lose_text": "You think this is victory? The darkness is always watching.",
   "victory_text": "Another soul claimed by the shadows. Victory is mine.",
   "defeat_text": "You may have won today, but I’ll find you in your sleep... and then you will truly know fear.",
   "champion_text": "I am the true king of darkness, unchallenged and eternal!"
}

var comp17 = {
	"id": 17,
	"name": "Eryndor Flamescar",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp17/Comp17_Avatar.png",
	"character_path": "res://Assets/Characters/Comp17/Comp17.png",
	"before_battle_text": "The fury of the inferno awaits you. Shall we dance?",
	"battle_text": "Feel the searing blaze of my wrath!",
	"initiative_win_text": "",
	"initiative_lose_text": "",
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
	"initiative_win_text": "",
	"initiative_lose_text": "",
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
	"initiative_win_text": "",
	"initiative_lose_text": "",
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
	"initiative_win_text": "",
	"initiative_lose_text": "",
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
