#adapted from http://springhole.net/writing_roleplaying_randomators/landscape.htm

#coffee-ized and Classed by Paul Scarrone 7-28-2013

#The data stored is pretty simple.  It works like this:
#
# The aVocab array has sub arrays that are named lists of data.
#
#aVocab[intCat]= new Array(); - The aVocab Array actually holds other arrays.
#aVocab[intCat][0]="FIRST" - This is the name of the list of data in this sub array.  The name helps the program find the data.
#aVocab[intCat][1] = new Array() - Yep, ANOTHER array - this is the array that holds the actual data.
#aVocab[intCat][1][intIncr++]="First thing <SECOND>" // See that <SECOND> tag?  Anything in brackets references another list.
#aVocab[intCat][1][intIncr++]="First thing <THIRD>"
#
# Unless it's the last entry, don't forget to increment and reset the counters!
#
#intCat++
#intIncr=0

exports.Landscape = ->
  aVocab = []
  intCat = 0
  intIncr = 0
  aVocab = []
  aVocab[intCat] = []
  aVocab[intCat][0] = "FIRST"
  aVocab[intCat][1] = []
  aVocab[intCat][1][intIncr++] = "You stand in a <TerrainDesc> <Area> <Objects>. <Features>."
  intCat++
  intIncr = 0
  aVocab[intCat] = []
  aVocab[intCat][0] = "TerrainDesc"
  aVocab[intCat][1] = []
  aVocab[intCat][1][intIncr++] = "broken"
  aVocab[intCat][1][intIncr++] = "flat"
  aVocab[intCat][1][intIncr++] = "hilly"
  aVocab[intCat][1][intIncr++] = "mountainous"
  intCat++
  intIncr = 0
  aVocab[intCat] = []
  aVocab[intCat][0] = "Area"
  aVocab[intCat][1] = []
  aVocab[intCat][1][intIncr++] = "area"
  aVocab[intCat][1][intIncr++] = "region"
  aVocab[intCat][1][intIncr++] = "terrain"
  intCat++
  intIncr = 0
  aVocab[intCat] = []
  aVocab[intCat][0] = "Objects"
  aVocab[intCat][1] = []
  aVocab[intCat][1][intIncr++] = "<PObjects>"
  aVocab[intCat][1][intIncr++] = "<SObjects>"
  aVocab[intCat][1][intIncr++] = "<PObjects> and <SObjects>"
  intCat++
  intIncr = 0
  aVocab[intCat] = []
  aVocab[intCat][0] = "PObjects"
  aVocab[intCat][1] = []
  aVocab[intCat][1][intIncr++] = "<ObjPop> <PlantDesc> <Plant>"
  aVocab[intCat][1][intIncr++] = "<ObjPop> <PlantStoneDesc> <Plant>"
  intCat++
  intIncr = 0
  aVocab[intCat] = []
  aVocab[intCat][0] = "SObjects"
  aVocab[intCat][1] = []
  aVocab[intCat][1][intIncr++] = "<ObjPop> <StoneDesc> <Stone>"
  aVocab[intCat][1][intIncr++] = "<ObjPop> <PlantStoneDesc> <Stone>"
  intCat++
  intIncr = 0
  aVocab[intCat] = []
  aVocab[intCat][0] = "Features"
  aVocab[intCat][1] = []
  aVocab[intCat][1][intIncr++] = "You can see <BFeatures>"
  aVocab[intCat][1][intIncr++] = "You can see <WFeatures>"
  aVocab[intCat][1][intIncr++] = "You can see <WFeatures> and <BFeatures>"
  intCat++
  intIncr = 0
  aVocab[intCat] = []
  aVocab[intCat][0] = "BFeatures"
  aVocab[intCat][1] = []
  aVocab[intCat][1][intIncr++] = "<Structure> <Distance>"
  intCat++
  intIncr = 0
  aVocab[intCat] = []
  aVocab[intCat][0] = "WFeatures"
  aVocab[intCat][1] = []
  aVocab[intCat][1][intIncr++] = "<WaterBody> <Distance>"
  intCat++
  intIncr = 0
  aVocab[intCat] = []
  aVocab[intCat][0] = "PlantStoneDesc"
  aVocab[intCat][1] = []
  aVocab[intCat][1][intIncr++] = "colorful"
  aVocab[intCat][1][intIncr++] = "diverse"
  aVocab[intCat][1][intIncr++] = "gigantic"
  aVocab[intCat][1][intIncr++] = "huge"
  aVocab[intCat][1][intIncr++] = "small"
  aVocab[intCat][1][intIncr++] = "unusual"
  aVocab[intCat][1][intIncr++] = "various"
  intCat++
  intIncr = 0
  aVocab[intCat] = []
  aVocab[intCat][0] = "PlantDesc"
  aVocab[intCat][1] = []
  aVocab[intCat][1][intIncr++] = "dead"
  aVocab[intCat][1][intIncr++] = "foul-smelling"
  aVocab[intCat][1][intIncr++] = "fruit-bearing"
  aVocab[intCat][1][intIncr++] = "healthy"
  aVocab[intCat][1][intIncr++] = "pleasant-smelling"
  aVocab[intCat][1][intIncr++] = "prickly"
  aVocab[intCat][1][intIncr++] = "thorny"
  aVocab[intCat][1][intIncr++] = "toxic"
  intCat++
  intIncr = 0
  aVocab[intCat] = []
  aVocab[intCat][0] = "StoneDesc"
  aVocab[intCat][1] = []
  aVocab[intCat][1][intIncr++] = "broken"
  aVocab[intCat][1][intIncr++] = "crystalline"
  aVocab[intCat][1][intIncr++] = "jagged"
  aVocab[intCat][1][intIncr++] = "rough"
  aVocab[intCat][1][intIncr++] = "smooth"
  aVocab[intCat][1][intIncr++] = "weather-worn"
  aVocab[intCat][1][intIncr++] = "worn-down"
  intCat++
  intIncr = 0
  aVocab[intCat] = []
  aVocab[intCat][0] = "ObjPop"
  aVocab[intCat][1] = []
  aVocab[intCat][1][intIncr++] = "covered with"
  aVocab[intCat][1][intIncr++] = "dotted with"
  aVocab[intCat][1][intIncr++] = "scattered with"
  aVocab[intCat][1][intIncr++] = "smattered with"
  aVocab[intCat][1][intIncr++] = "spotted with"
  aVocab[intCat][1][intIncr++] = "sprinkled with"
  aVocab[intCat][1][intIncr++] = "replete with"
  intCat++
  intIncr = 0
  aVocab[intCat] = []
  aVocab[intCat][0] = "Plant"
  aVocab[intCat][1] = []
  aVocab[intCat][1][intIncr++] = "carnivorous plants"
  aVocab[intCat][1][intIncr++] = "grasses"
  aVocab[intCat][1][intIncr++] = "plants"
  aVocab[intCat][1][intIncr++] = "shrubs"
  aVocab[intCat][1][intIncr++] = "<TreeType>trees"
  aVocab[intCat][1][intIncr++] = "vines"
  aVocab[intCat][1][intIncr++] = "wildflowers"
  intCat++
  intIncr = 0
  aVocab[intCat] = []
  aVocab[intCat][0] = "TreeType"
  aVocab[intCat][1] = []
  aVocab[intCat][1][intIncr++] = ""
  aVocab[intCat][1][intIncr++] = ""
  aVocab[intCat][1][intIncr++] = "deciduous "
  aVocab[intCat][1][intIncr++] = "evergreen "
  intCat++
  intIncr = 0
  aVocab[intCat] = []
  aVocab[intCat][0] = "Stone"
  aVocab[intCat][1] = []
  aVocab[intCat][1][intIncr++] = "rocks"
  aVocab[intCat][1][intIncr++] = "stones"
  intCat++
  intIncr = 0
  aVocab[intCat] = []
  aVocab[intCat][0] = "WaterBody"
  aVocab[intCat][1] = []
  aVocab[intCat][1][intIncr++] = "a lake"
  aVocab[intCat][1][intIncr++] = "a small body of water"
  aVocab[intCat][1][intIncr++] = "the sea"
  aVocab[intCat][1][intIncr++] = "a stream"
  aVocab[intCat][1][intIncr++] = "a river"
  aVocab[intCat][1][intIncr++] = "a waterfall"
  intCat++
  intIncr = 0
  aVocab[intCat] = []
  aVocab[intCat][0] = "Structure"
  aVocab[intCat][1] = []
  aVocab[intCat][1][intIncr++] = "a castle"
  aVocab[intCat][1][intIncr++] = "a cave"
  aVocab[intCat][1][intIncr++] = "a citadel"
  aVocab[intCat][1][intIncr++] = "a city"
  aVocab[intCat][1][intIncr++] = "a fort"
  aVocab[intCat][1][intIncr++] = "a monastery"
  aVocab[intCat][1][intIncr++] = "a ruin"
  aVocab[intCat][1][intIncr++] = "a tower"
  aVocab[intCat][1][intIncr++] = "a town"
  aVocab[intCat][1][intIncr++] = "a village"
  intCat++
  intIncr = 0
  aVocab[intCat] = []
  aVocab[intCat][0] = "Distance"
  aVocab[intCat][1] = []
  aVocab[intCat][1][intIncr++] = "to the east"
  aVocab[intCat][1][intIncr++] = "to the north"
  aVocab[intCat][1][intIncr++] = "to the south"
  aVocab[intCat][1][intIncr++] = "to the west"
  aVocab[intCat][1][intIncr++] = "close by"
  aVocab[intCat][1][intIncr++] = "in the distance"
  aVocab[intCat][1][intIncr++] = "on the horizon"
  aVocab[intCat][1][intIncr++] = "miles away"
  aVocab[intCat][1][intIncr++] = "nearby"
  aVocab[intCat][1][intIncr++] = "not too far away"
  intCat++
  intIncr = 0
  aVocab[intCat] = []
  aVocab[intCat][0] = "THIRD"
  aVocab[intCat][1] = []

  @GetAVocab = ->
    aVocab

  undefined