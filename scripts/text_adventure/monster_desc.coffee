#The data stored is pretty simple.  It works like this:
#
# The aVocab array has sub arrays that are named lists of data.
#
#aVocab[intCat]= []; - The aVocab Array actually holds other arrays.
#aVocab[intCat][0]="FIRST" - This is the name of the list of data in this sub array.  The name helps the program find the data.
#aVocab[intCat][1] = [] - Yep, ANOTHER array - this is the array that holds the actual data.
#aVocab[intCat][1][intIncr++]="First thing <SECOND>" // See that <SECOND> tag?  Anything in brackets references another list.
#aVocab[intCat][1][intIncr++]="First thing <THIRD>"
#
# Unless it's the last entry, don't forget to increment and reset the counters!
#
#intCat++
#intIncr=0
exports.MonsterDesc = ->
	aVocab = []
	intCat = 0
	intIncr = 0

	aVocab[intCat] = []
	aVocab[intCat][0] = "FIRST"
	aVocab[intCat][1] = []
	aVocab[intCat][1][intIncr++] = "This big bad is <adj> <femaletype>.  She plans to <plan> with <thing>.  She <underlings> and <weakness>."
	aVocab[intCat][1][intIncr++] = "This big bad is <adj> <femaletype>.  She has taken over <place> with <thing>.  She <underlings> and <weakness>."
	aVocab[intCat][1][intIncr++] = "This big bad is <adj> <maletype>.  He plans to <plan> with <thing>.  He <underlings> and <weakness>."
	aVocab[intCat][1][intIncr++] = "This big bad is <adj> <maletype>.  He has taken over <place> with <thing>.  He <underlings> and <weakness>."
	intCat++
	intIncr = 0
	aVocab[intCat] = []
	aVocab[intCat][0] = "adj"
	aVocab[intCat][1] = []
	aVocab[intCat][1][intIncr++] = "a cunning"
	aVocab[intCat][1][intIncr++] = "a conniving"
	aVocab[intCat][1][intIncr++] = "a deranged"
	aVocab[intCat][1][intIncr++] = "a maniacal"
	aVocab[intCat][1][intIncr++] = "a psychotic"
	aVocab[intCat][1][intIncr++] = "a sadistic"
	aVocab[intCat][1][intIncr++] = "a scheming"
	intCat++
	intIncr = 0
	aVocab[intCat] = []
	aVocab[intCat][0] = "femaletype"
	aVocab[intCat][1] = []
	aVocab[intCat][1][intIncr++] = "<species> <f_only>"
	aVocab[intCat][1][intIncr++] = "<f_only>"
	aVocab[intCat][1][intIncr++] = "female <species>"
	aVocab[intCat][1][intIncr++] = "female <both>"
	intCat++
	intIncr = 0
	aVocab[intCat] = []
	aVocab[intCat][0] = "maletype"
	aVocab[intCat][1] = []
	aVocab[intCat][1][intIncr++] = "<species> <m_only>"
	aVocab[intCat][1][intIncr++] = "<m_only>"
	aVocab[intCat][1][intIncr++] = "male <species>"
	aVocab[intCat][1][intIncr++] = "male <both>"
	intCat++
	intIncr = 0
	aVocab[intCat] = []
	aVocab[intCat][0] = "f_only"
	aVocab[intCat][1] = []
	aVocab[intCat][1][intIncr++] = "duchess"
	aVocab[intCat][1][intIncr++] = "empress"
	aVocab[intCat][1][intIncr++] = "queen"
	aVocab[intCat][1][intIncr++] = "lady"
	aVocab[intCat][1][intIncr++] = "sorceress"
	aVocab[intCat][1][intIncr++] = "witch"
	aVocab[intCat][1][intIncr++] = "woman"
	intCat++
	intIncr = 0
	aVocab[intCat] = []
	aVocab[intCat][0] = "m_only"
	aVocab[intCat][1] = []
	aVocab[intCat][1][intIncr++] = "duke"
	aVocab[intCat][1][intIncr++] = "emperor"
	aVocab[intCat][1][intIncr++] = "king"
	aVocab[intCat][1][intIncr++] = "lord"
	aVocab[intCat][1][intIncr++] = "man"
	aVocab[intCat][1][intIncr++] = "sorcerer"
	aVocab[intCat][1][intIncr++] = "wizard"
	intCat++
	intIncr = 0
	aVocab[intCat] = []
	aVocab[intCat][0] = "both"
	aVocab[intCat][1] = []
	aVocab[intCat][1][intIncr++] = "advisor"
	aVocab[intCat][1][intIncr++] = "general"
	aVocab[intCat][1][intIncr++] = "politician"
	aVocab[intCat][1][intIncr++] = "scientist"
	intCat++
	intIncr = 0
	aVocab[intCat] = []
	aVocab[intCat][0] = "species"
	aVocab[intCat][1] = []
	aVocab[intCat][1][intIncr++] = "alien"
	aVocab[intCat][1][intIncr++] = "cyborg"
	aVocab[intCat][1][intIncr++] = "demon"
	aVocab[intCat][1][intIncr++] = "djinn"
	aVocab[intCat][1][intIncr++] = "dragon"
	aVocab[intCat][1][intIncr++] = "monster"
	aVocab[intCat][1][intIncr++] = "mutant"
	aVocab[intCat][1][intIncr++] = "vampire"
	aVocab[intCat][1][intIncr++] = "werewolf"
	intCat++
	intIncr = 0
	aVocab[intCat] = []
	aVocab[intCat][0] = "plan"
	aVocab[intCat][1] = []
	aVocab[intCat][1][intIncr++] = "become a god"
	aVocab[intCat][1][intIncr++] = "become immortal"
	aVocab[intCat][1][intIncr++] = "destroy <place>"
	aVocab[intCat][1][intIncr++] = "take over <place>"
	aVocab[intCat][1][intIncr++] = "take over <place>"
	intCat++
	intIncr = 0
	aVocab[intCat] = []
	aVocab[intCat][0] = "place"
	aVocab[intCat][1] = []
	aVocab[intCat][1][intIncr++] = "the country"
	aVocab[intCat][1][intIncr++] = "a holy site"
	aVocab[intCat][1][intIncr++] = "the empire"
	aVocab[intCat][1][intIncr++] = "the galaxy"
	aVocab[intCat][1][intIncr++] = "the kingdom"
	aVocab[intCat][1][intIncr++] = "the planet"
	aVocab[intCat][1][intIncr++] = "the realm"
	aVocab[intCat][1][intIncr++] = "the universe"
	aVocab[intCat][1][intIncr++] = "the world"
	intCat++
	intIncr = 0
	aVocab[intCat] = []
	aVocab[intCat][0] = "thing"
	aVocab[intCat][1] = []
	aVocab[intCat][1][intIncr++] = "arcane magic"
	aVocab[intCat][1][intIncr++] = "the <integer> mystic crystals"
	aVocab[intCat][1][intIncr++] = "the <integer> mystic talismans"
	aVocab[intCat][1][intIncr++] = "a biological weapon"
	aVocab[intCat][1][intIncr++] = "a biotechnological breakthrough"
	aVocab[intCat][1][intIncr++] = "a coup"
	aVocab[intCat][1][intIncr++] = "a piece of ancient technology"
	aVocab[intCat][1][intIncr++] = "a piece of powerful technology"
	aVocab[intCat][1][intIncr++] = "a powerful artifact"
	aVocab[intCat][1][intIncr++] = "a legendary artifact"
	aVocab[intCat][1][intIncr++] = "a legendary weapon"
	aVocab[intCat][1][intIncr++] = "a new invention"
	aVocab[intCat][1][intIncr++] = "a new superweapon"
	aVocab[intCat][1][intIncr++] = "careful political manipulation"
	aVocab[intCat][1][intIncr++] = "dark magic"
	aVocab[intCat][1][intIncr++] = "mad science"
	intCat++
	intIncr = 0
	aVocab[intCat] = []
	aVocab[intCat][0] = "thing2"
	aVocab[intCat][1] = []
	aVocab[intCat][1][intIncr++] = "a piece of ancient technology"
	aVocab[intCat][1][intIncr++] = "a piece of powerful technology"
	aVocab[intCat][1][intIncr++] = "a powerful artifact"
	aVocab[intCat][1][intIncr++] = "a powerful weapon"
	aVocab[intCat][1][intIncr++] = "a legendary artifact"
	aVocab[intCat][1][intIncr++] = "a legendary weapon"
	intCat++
	intIncr = 0
	aVocab[intCat] = []
	aVocab[intCat][0] = "underlings"
	aVocab[intCat][1] = []
	aVocab[intCat][1][intIncr++] = "commands an enormous army"
	aVocab[intCat][1][intIncr++] = "commands an army of <armytype>"
	aVocab[intCat][1][intIncr++] = "commands a ragtag group of outlaws"
	aVocab[intCat][1][intIncr++] = "commands a small team of elite underlings"
	aVocab[intCat][1][intIncr++] = "has an extensive underground network"
	aVocab[intCat][1][intIncr++] = "has strong influence over many important people"
	aVocab[intCat][1][intIncr++] = "has a cult of devoted followers"
	aVocab[intCat][1][intIncr++] = "easily manipulates others"
	aVocab[intCat][1][intIncr++] = "uses mind control to create mooks"
	intCat++
	intIncr = 0
	aVocab[intCat] = []
	aVocab[intCat][0] = "armytype"
	aVocab[intCat][1] = []
	aVocab[intCat][1][intIncr++] = "artifically-created monsters"
	aVocab[intCat][1][intIncr++] = "artificially-created mooks"
	aVocab[intCat][1][intIncr++] = "artificially-created soldiers"
	aVocab[intCat][1][intIncr++] = "enhanced soldiers"
	aVocab[intCat][1][intIncr++] = "monsters"
	aVocab[intCat][1][intIncr++] = "robots"
	aVocab[intCat][1][intIncr++] = "undead"
	intCat++
	intIncr = 0
	aVocab[intCat] = []
	aVocab[intCat][0] = "weakness"
	aVocab[intCat][1] = []
	aVocab[intCat][1][intIncr++] = "can only be defeated through the power of love"
	aVocab[intCat][1][intIncr++] = "can only be defeated through the determination of the human spirit"
	aVocab[intCat][1][intIncr++] = "can only be defeated through wit and strategy"
	aVocab[intCat][1][intIncr++] = "can only be defeated with <thing2>"
	aVocab[intCat][1][intIncr++] = "is terrified of mirrors"
	aVocab[intCat][1][intIncr++] = "is terrified of cats"
	aVocab[intCat][1][intIncr++] = "is terrified of insects"
	aVocab[intCat][1][intIncr++] = "is extremely vain"
	aVocab[intCat][1][intIncr++] = "relies on a mystical artifact to stay alive"
	aVocab[intCat][1][intIncr++] = "relies on advanced technology to stay alive"
	aVocab[intCat][1][intIncr++] = "is secretly in love with the hero"
	aVocab[intCat][1][intIncr++] = "is only vulnerable at a certain time"
	aVocab[intCat][1][intIncr++] = "has some followers who question their loyalty"
	aVocab[intCat][1][intIncr++] = "can be irrationally power-hungry"
	aVocab[intCat][1][intIncr++] = "sometimes doesn't know when to quit"
	aVocab[intCat][1][intIncr++] = "is extremely obsessive"
	aVocab[intCat][1][intIncr++] = "is extremely short-tempered"
	aVocab[intCat][1][intIncr++] = "is somewhat short-sighted"
	intCat++
	intIncr = 0
	aVocab[intCat] = []
	aVocab[intCat][0] = "integer"
	aVocab[intCat][1] = []
	aVocab[intCat][1][intIncr++] = "three"
	aVocab[intCat][1][intIncr++] = "four"
	aVocab[intCat][1][intIncr++] = "five"
	aVocab[intCat][1][intIncr++] = "six"
	aVocab[intCat][1][intIncr++] = "seven"

	#Leave to Copy!
	intCat++
	intIncr = 0
	aVocab[intCat] = []
	aVocab[intCat][0] = "THIRD"
	aVocab[intCat][1] = []
	aVocab[intCat][1][intIncr++] = ""

	@GetAVocab = ->
    aVocab

  undefined