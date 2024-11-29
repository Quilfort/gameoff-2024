extends Node

var comp1 = {
	"id": 1,
	"name": "Celeste Ardyn",
	"computer_strategy": "default",
	"avatar_path": "res://Assets/Characters/Comp1/Comp1_Avatar.png",
	"character_path": "res://Assets/Characters/Comp1/Comp1.png",
	"before_battle_text": "The throne is mine by right. Do you dare defy me?",
	"battle_text": "Kneel before your queen, or be crushed under my will!",
	"initiative_win_text": "Your hesitation is your undoing. I lead this dance!",
	"initiative_lose_text": "A bold move... but I will still prevail!",
	"victory_text": "Fate favors me, as it always should. Another step closer to my destiny!",
	"defeat_text": "You may have won, but this is far from over. Remember my name!",
	"champion_text": "Bow down! I am the rightful ruler, and this proves it!",
	"info_welcome_text": "Celeste Ardyn, ready to face the rightful ruler?",
	"info_fun_fact_text": "Celeste has a burning desire for power, but her confidence is unmatched.",
	"info_strategy_text": "Celeste plays it safe with balanced strategies, so expect a calculated approach.",	
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
	"champion_text": "The whispers were right—I’m irresistible even in victory!",
  	"info_welcome_text": "Ravyn Thorn, ready for a dance with a demon?",
  	"info_fun_fact_text": "Ravyn loves the thrill of the hunt, but don’t let that charm fool you.",
  	"info_strategy_text": "Ravyn favors odd numbers, so expect a focus on uneven guesses. Stay sharp!",
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
	"champion_text": "Champion? Me? Oh wow! I just wanted to have fun!",
	"info_welcome_text": "Kaia Solis, ready to have some fun?",
	"info_fun_fact_text": "Kaia carries a tube everywhere—no one knows what’s inside, but it’s always a surprise!",
	"info_strategy_text": "Kaia prefers even numbers, so expect her to focus on guessing those. Stay alert for her even-numbered guesses!"
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
	"champion_text": "The throne is mine, as it was always destined to be.",
	"info_welcome_text": "Peter Duskbane, ready to challenge humanity?",
	"info_fun_fact_text": "Peter believes the throne is his by right, and he won’t stop until it's reclaimed.",
	"info_strategy_text": "Peter guesses by halving the number—always cutting the range in half. Watch for his methodical approach!"
}

var comp5 = {
	"id": 5,
	"name": "Penny Blackwater",
	"computer_strategy": "random",
	"avatar_path": "res://Assets/Characters/Comp5/Comp5_Avatar.png",
	"character_path": "res://Assets/Characters/Comp5/Comp5.png",
	"before_battle_text": "Hi there! Oh wait... is this where the fight is? Yay!",
	"battle_text": "Ooh, is this part of the game? Let’s have fun!",
	"initiative_win_text": "I get to go first? Oh wow, what do I do now?",
	"initiative_lose_text": "Oh, you’re going first? Okay! I'll just watch and learn.",
	"victory_text": "Yay, I won! Wait... what did I win again?",
	"defeat_text": "That was so much fun! Can we have snacks now?",
	"champion_text": "Me? A champion? Oh, this is so exciting! Do I get cake?",
	"info_welcome_text": "Penny Blackwater, ready to have some fun?",
	"info_fun_fact_text": "Penny is friends with David! They love to have fun together, even during battles.",
	"info_strategy_text": "Penny’s strategy is completely random—expect the unexpected at any moment!"
}

var comp6 = {
	"id": 6,
	"name": "David Shadowtorn",
	"computer_strategy": "preference_for_4_and_5_strategy",
	"avatar_path": "res://Assets/Characters/Comp6/Comp6_Avatar.png",
	"character_path": "res://Assets/Characters/Comp6/Comp6.png",
	"before_battle_text": "Silent steps. Sharp blade. Your time ends here.",
	"battle_text": "No more shadows. I’ll claim the throne in the open.",
	"initiative_win_text": "I move first. Your fate is sealed.",
	"initiative_lose_text": "A delay, nothing more. You cannot escape.",
	"victory_text": "The best remain standing. You were never a match.",
	"defeat_text": "Even the best stumble... but shadows always return.",
	"champion_text": "The throne is mine. I no longer hide in the shadows.",
	"info_welcome_text": "David Shadowtorn, ready to face your fate?",
	"info_fun_fact_text": "David prefers to keep to the shadows with Penny, but his blade is sharp when he emerges.",
	"info_strategy_text": "David focuses on numbers with 4 or 5 in them—watch for his preference towards these digits."
}

var comp7 = {
	"id": 7,
	"name": "Elara Dawnlight",
	"computer_strategy": "preference_for_1_and_6_strategy",
	"avatar_path": "res://Assets/Characters/Comp7/Comp7_Avatar.png",
	"character_path": "res://Assets/Characters/Comp7/Comp7.png",
	"before_battle_text": "I fight not for myself, but for a world united in peace.",
	"battle_text": "Together, we can make this world better. But I won’t hold back!",
	"initiative_win_text": "The light guides me first. Let us see where it takes us.",
	"initiative_lose_text": "You move first. May your actions reflect wisdom.",
	"victory_text": "This victory is for everyone, no matter their kind.",
	"defeat_text": "Please, use your power wisely. The world depends on it.",
	"champion_text": "A united world starts here. Let us walk this path together.",
	"info_welcome_text": "Elara Dawnlight, ready to unite the world?",
	"info_fun_fact_text": "Elara fights for peace, always thinking of the greater good.",
	"info_strategy_text": "Elara favors numbers with 1 or 6 in them—look out for these digits in her guesses."
}

var comp8 = {
	"id": 8,
	"name": "Serah Dawnlight",
	"computer_strategy": "range_split_strategy",
	"avatar_path": "res://Assets/Characters/Comp8/Comp8_Avatar.png",
	"character_path": "res://Assets/Characters/Comp8/Comp8.png",
	"before_battle_text": "My sister Elara may fight for peace, but I fight for power. Let’s see who truly deserves the throne.",
	"battle_text": "I will conquer the stars themselves to claim what is mine!",
	"initiative_win_text": "The power of the stars is mine to command! I strike first!",
	"initiative_lose_text": "You may have the first move, but I will take control soon enough!",
	"victory_text": "Victory is mine! Power is the only truth.",
	"defeat_text": "The stars turned their back on me this time... but I’ll take what is mine eventually.",
	"champion_text": "I am the one who will rule, with power beyond the stars!",
	"info_welcome_text": "Serah Dawnlight, ready to claim the power of the stars?",
	"info_fun_fact_text": "Serah is driven by a hunger for power, always seeking to dominate.",
	"info_strategy_text": "Serah alternates between guessing numbers near the smallest and largest edges, expanding by up to a random range for unpredictable results."
}

var comp9 = {
	"id": 9,
	"name": "Lilith Inferno",
	"computer_strategy": "proximity_bias_strategy",
	"avatar_path": "res://Assets/Characters/Comp9/Comp9_Avatar.png",
	"character_path": "res://Assets/Characters/Comp9/Comp9.png",
	"before_battle_text": "Underestimate me, and you will regret it. I will set this world ablaze!",
	"battle_text": "Feel the flames of hell—there's no escape!",
	"initiative_win_text": "The flames favor me! I strike first and burn you to the ground!",
	"initiative_lose_text": "You may have the first strike, but it won't save you from the inferno that’s coming!",
	"victory_text": "I told you. The world will burn, and I will reign.",
	"defeat_text": "You may have won this time, but next time, the fires of hell will consume you.",
	"champion_text": "I am the queen of devils! Let the world burn in my name!",
	"info_welcome_text": "Lilith Inferno, ready to set the world ablaze?",
	"info_fun_fact_text": "Lilith is a force of destruction, leaving nothing but ashes in her wake.",
	"info_strategy_text": "Lilith focuses on guessing numbers closest to the midpoint of the range to quickly narrow down the possibilities."
}

var comp10 = {
	"id": 10,
	"name": "Kael Ardyn",
	"computer_strategy": "pi_explorer_strategy",
	"avatar_path": "res://Assets/Characters/Comp10/Comp10_Avatar.png",
	"character_path": "res://Assets/Characters/Comp10/Comp10.png",
	"before_battle_text": "The flames of destiny burn within me. Let’s fight!",
	"battle_text": "Burn brightly or burn out—let’s see your choice!",
	"initiative_win_text": "I am the chosen one, the flames are mine to command!",
	"initiative_lose_text": "It matters not, I’ll rise and burn brighter next time!",
	"victory_text": "Another victory to stoke the eternal flames!",
	"defeat_text": "The fire flickers, but it will never die. I’ll return.",
	"champion_text": "I am the eternal flame, and none can extinguish my glory!",
	"info_welcome_text": "Kael Ardyn, the eternal flame, ready to fight for destiny.",
	"info_fun_fact_text": "Kael believes in the eternal flame, burning brightly with destiny's fire.",
	"info_strategy_text": "Kael guesses numbers closest to multiples of Pi (π) within the current range, adding a mathematical twist to the guessing pattern."
}

var comp11 = {
	"id": 11,
	"name": "Freya Shadowtorn",
	"computer_strategy": "guess_within_player_range",
	"avatar_path": "res://Assets/Characters/Comp11/Comp11_Avatar.png",
	"character_path": "res://Assets/Characters/Comp11/Comp11.png",
	"before_battle_text": "The light shall guide me to victory. Let’s begin.",
	"battle_text": "Behold the radiant power of my resolve!",
	"initiative_win_text": "The light is with me. I can feel it guiding my every move!",
	"initiative_lose_text": "It’s just a momentary setback. I’ll find my way to victory!",
	"victory_text": "Victory shines brightly in my hands!",
	"defeat_text": "Your strength eclipsed mine today, but dawn always returns.",
	"champion_text": "I am the champion... but the throne belongs to my brother, David. He will rule, and I’ll find peace.",
	"info_welcome_text": "Freya Shadowtorn, guided by light to victory?",
	"info_fun_fact_text": "Freya believes in her brother David and the power of light, even in the darkest of times.",
	"info_strategy_text": "Freya guesses a number within a range of 10 numbers higher or lower than the player’s guess, adjusting for the boundaries of the possible range.",
}

var comp12 = {
	"id": 12,
	"name": "Zephyr Windlord",
	"computer_strategy": "choose_with_zero",
	"avatar_path": "res://Assets/Characters/Comp12/Comp12_Avatar.png",
	"character_path": "res://Assets/Characters/Comp12/Comp12.png",
	"before_battle_text": "The wind whispers of victory. Prepare yourself!",
	"battle_text": "Feel the breeze of my power as it sweeps you away!",
	"initiative_win_text": "The winds favor me. You cannot escape my reach.",
	"initiative_lose_text": "The wind shifts, but I will find my way again.",
	"victory_text": "The storm has spoken, and it declares my triumph!",
	"defeat_text": "The wind subsides, but I will return stronger than ever.",
	"champion_text": "I am the storm incarnate. No one can stand against my thunder!",
	"info_welcome_text": "Zephyr Windlord, the storm's chosen one, ready for battle.",
	"info_fun_fact_text": "Zephyr believes the wind guides his every move.",
	"info_strategy_text": "Zephyr always picks a number with a ‘0’ in it", 
}

var comp13 = {
	"id": 13,
	"name": "Sylva Greenhart",
	"computer_strategy": "choose_double_digit_strategy",
	"avatar_path": "res://Assets/Characters/Comp13/Comp13_Avatar.png",
	"character_path": "res://Assets/Characters/Comp13/Comp13.png",
	"before_battle_text": "I am the shield of nature, and nature’s wrath is cold as ice. Prepare yourself!",
	"battle_text": "The forest is my armor, the winter my sword. Face the storm of nature!",
	"initiative_win_text": "I have won the first move, because nature always strikes first.",
	"initiative_lose_text": "The winds of nature may bend, but they do not break. I will not fall easily.",
	"victory_text": "Another enemy frozen by nature’s might. The forest shields me once more!",
	"defeat_text": "The chill may fade... but I am the shield of nature, and I will rise again.",
	"champion_text": "I am the guardian of the woods, the frost shall crown me the eternal shield of nature!",
	"info_welcome_text": "Sylva Greenhart, the shield of nature, stands ready.",
	"info_fun_fact_text": "Sylva draws strength from the forest and the winter winds.",
	"info_strategy_text": "Sylva always picks a number with two matching digits"
}

var comp14 = {
   "id": 14,
   "name": "Thalric Greenhart",
   "computer_strategy": "choose_multiple_of_5_strategy",
   "avatar_path": "res://Assets/Characters/Comp14/Comp14_Avatar.png",
   "character_path": "res://Assets/Characters/Comp14/Comp14.png",
   "before_battle_text": "My bird brain is ready to soar. Prepare to face the wind’s fury!",
   "battle_text": "The woods are my domain, and you’ll feel every leaf in your path!",
   "initiative_win_text": "You might think you can fly, but I’ve got the winds on my side!",
   "initiative_lose_text": "Don’t think for a second you’ve outflown me… I’ll rise again!",
   "victory_text": "The woods cheer my victory—this throne is mine to protect!",
   "defeat_text": "A bird can fall, but the forest always picks itself up. I’ll be back!",
   "champion_text": "I am the king of the woods, the heart of nature’s might!",
   "info_welcome_text": "Thalric Greenhart, master of the woods, awaits your challenge!",
	"info_fun_fact_text": "Thalric has a deep connection with nature, and his bird instincts never fail him.",
	"info_strategy_text": "Thalric always picks a number that's a multiple of 5. If it's in the range, he’ll go for it!"
}

var comp15 = {
   "id": 15,
   "name": "Zelora Dawncrest",
   "computer_strategy": "choose_letter_q_strategy",
   "avatar_path": "res://Assets/Characters/Comp15/Comp15_Avatar.png",
   "character_path": "res://Assets/Characters/Comp15/Comp15.png",
   "before_battle_text": "The stars above guide my every step, and they will not falter now.",
   "battle_text": "Prepare yourself—my light will pierce through the darkness!",
   "initiative_win_text": "The heavens have spoken in my favor. I shall lead the way!",
   "initiative_lose_text": "The stars may flicker, but their path will always return to me.",
   "victory_text": "The light of the stars shines bright. Victory is mine!",
   "defeat_text": "The night may have won, but the dawn always rises again.",
   "champion_text": "I am the chosen of the stars, the celestial champion of light!",
   "info_welcome_text": "Zelora's motto is Quality over Quantity",
   "info_fun_fact_text": "Loves the Letter Q",
   "info_strategy_text": "QQQQQQQQ\nQQQQQQQ!",
}

var comp16 = {
   "id": 16,
   "name": "Draegon Darkbane",
   "computer_strategy": "choose_repeated_digits_strategy",
   "avatar_path": "res://Assets/Characters/Comp16/Comp16_Avatar.png",
   "character_path": "res://Assets/Characters/Comp16/Comp16.png",
   "before_battle_text": "Your fear echoes through the abyss. It will consume you.",
   "battle_text": "Feel the weight of the demon's curse—your doom is inevitable.",
   "initiative_win_text": "I strike first, and your fate is sealed.",
   "initiative_lose_text": "You think this is victory? The darkness is always watching.",
   "victory_text": "Another soul claimed by the shadows. Victory is mine.",
   "defeat_text": "You may have won today, but I’ll find you in your sleep... and then you will truly know fear.",
   "champion_text": "I am the true king of darkness, unchallenged and eternal!",
   "info_welcome_text": "Draegon Darkbane, master of darkness, awaits your soul.",
   "info_fun_fact_text": "Draegon’s power grows stronger the more he is underestimated—beware!",
   "info_strategy_text": "Draegon selects numbers with repeating digits",
}

var comp17 = {
   "id": 17,
   "name": "TheGoat",
   "computer_strategy": "choose_unique_digits_strategy",
   "avatar_path": "res://Assets/Characters/Comp17/Comp17_Avatar.png",
   "character_path": "res://Assets/Characters/Comp17/Comp17.png",
   "before_battle_text": "Baa! Baaa-haaahh!",
   "battle_text": "Maaah! Maaahhh!!",
   "initiative_win_text": "Baa! Baaaaaah!",
   "initiative_lose_text": "Maaaaah! Maaaaahhh!",
   "victory_text": "Baa-haa! Baaa-haaa!",
   "defeat_text": "Maaahh... Maaaahhh!",
   "champion_text": "Baaaahh! I AM THE GOAT!",
   "info_welcome_text": "Baa-haa! Baaa-haaa!",
   "info_fun_fact_text": "Fun Baaaahh!!",
   "info_strategy_text": "TheGoat always picks numbers where no digit repeats. Every choice is unique, just like me!"
}

var comp18 = {
   "id": 18,
   "name": "Sir Bone",
   "computer_strategy": "choose_same_first_last_digit_strategy",
   "avatar_path": "res://Assets/Characters/Comp18/Comp18_Avatar.png",
   "character_path": "res://Assets/Characters/Comp18/Comp18.png",
   "before_battle_text": "Ah, my dear friend, I do hope you’ve prepared for what’s to come. Shall we begin?",
   "battle_text": "Do brace yourself, old sport! The battle shall be most thrilling, I dare say!",
   "initiative_win_text": "Oh, splendid! I do believe the odds are in my favour, don’t you think?",
   "initiative_lose_text": "A bit of a setback, I must say. But no matter, we’ll carry on!",
   "victory_text": "Ah, victory, my good fellow! Quite a delightful affair, wouldn’t you agree?",
   "defeat_text": "Oh, well done indeed. Perhaps we can enjoy a nice cup of tea together after this little scuffle?",
   "champion_text": "And so, it is I who shall wear the crown! A true champion of unparalleled grace!",
   "info_welcome_text": "Prepare yourself for a gentleman’s duel! I do declare this battle will be most entertaining!",
   "info_fun_fact_text": "I once won a game of chess using only pawns. Quite the strategist, wouldn't you say?",
   "info_strategy_text": "Sir Bone always selects numbers where the first and last digits are the same."
}

var comp19 = {
   "id": 19,
   "name": "Grimshaw Rotfury",
   "computer_strategy": "choose_throne_number",
   "avatar_path": "res://Assets/Characters/Comp19/Comp19_Avatar.png",
   "character_path": "res://Assets/Characters/Comp19/Comp19.png",
   "before_battle_text": "You might think you can bury me, but I’ll rise... and storm your battlefield!",
   "battle_text": "What’s the matter? Not feeling ‘dead’ enough yet? Here comes the storm!",
   "initiative_win_text": "I might be dead, but I’m *dying* to win this!",
   "initiative_lose_text": "I’m falling apart, but don’t worry, I’ll come back for you!",
   "victory_text": "Another soul claimed! The storm rages on, and I remain unbroken!",
   "defeat_text": "You might’ve beaten me, but I’ll crawl back for a rematch, sooner than you think.",
   "champion_text": "The storm can rage all it wants, but I’m already dead... and unbeatable!",
   "info_welcome_text": "I’m not just some rotting corpse—you’ll regret underestimating me!",
   "info_fun_fact_text": "Fun fact: I’m already dead, and I’m still haunting you!",
   "info_strategy_text": "T + H + R + O + N + E",
}

var comp_tutorial = {
   "id": 20,
   "name": "King Ardyn",
   "computer_strategy": "tutorial",
   "avatar_path": "res://Assets/Characters/CompTutorial/CompTutorial_Avatar.png",
   "character_path": "res://Assets/Characters/CompTutorial/CompTutorial.png",
   "before_battle_text": "I will defend my throne with all I’ve learned. Let’s begin your training.",
   "battle_text": "Prepare yourself. The crown may be heavy, but my will is stronger!",
   "initiative_win_text": "Victory is the first lesson of many. Keep up!",
   "initiative_lose_text": "Don’t mistake this loss. A king always learns from his failures.",
   "victory_text": "The throne stands firm, and so do I. Another lesson completed.",
   "defeat_text": "The throne may slip from my grasp today, but it will always call me back.",
   "champion_text": "As king, I reign supreme in both battle and wisdom!",
   "info_welcome_text": "This is my secret info!",
   "info_fun_fact_text": "This is my fun fact!",
   "info_strategy_text": "This is my strategy!",
}


func get_all_computers():
	var computers = []
	for property in get_property_list():
		var computer = get(property.name)
		if typeof(computer) == TYPE_DICTIONARY and computer.id != 20:
			computers.append(computer)
	return computers
