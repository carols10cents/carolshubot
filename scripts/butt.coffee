# butt.coffee
#
# Description:
#   butt.
#
#   Set the environment variable HUBOT_BUTT_TRIGGER_FREQ to [1, +inf) to change
#   how frequently the buttscript responds. Lower numbers correspond to more
#   responses, e.g. a value of 6 corresponds to 1 in 6 messages responded.
#
#   Similarly, set the env var HUBOT_BUTT_REPLACE_FREQ to [1, +inf) to change
#   how many words are replaced in a given phrase selected for butting.
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_BUTT_TRIGGER_FREQ [1, +inf) - how often the buttbot script triggers, 1 = always
#   HUBOT_BUTT_REPLACE_FREQ [1, +inf) - how many words are butted, 1 = all words
#
# Commands:
#   "" - buttbot script technically triggers on every message
#
# Notes:
#   A port of buttbot, an IRC bot in perl: https://code.google.com/p/buttbot/
#
# Author:
#   devmage

# -------------------------------------------------------------------------------------------------
# configs and data

# defaults
DEFAULT_TRIGGER_FREQ_DENOM = 51 # buttbot default, one in 51 messages trigger the bot
DEFAULT_REPLACE_FREQ_DENOM = 11 # buttbot default, one in 11 unique words per statement replaced
MEME = "butt" # configurable I guess but[t] why would you ever want to change it...

# environment variables
triggerEnv = process.env.HUBOT_BUTT_TRIGGER_FREQ
replaceEnv = process.env.HUBOT_BUTT_REPLACE_FREQ

# utils
unless String::trim then String::trim = -> @replace /^\s+|\s+$/g, ""

Array::unique = ->
  output = {}
  output[@[key]] = @[key] for key in [0...@length]
  value for key, value of output

# list of stopwords to ignore for butting
stopwords = [
  "a",
  "about",
  "above",
  "absent",
  "across",
  "after",
  "against",
  "all",
  "along",
  "among",
  "an",
  "and",
  "are",
  "around",
  "as",
  "at",
  "atop",
  "be",
  "before",
  "behind",
  "below",
  "beneath",
  "beside",
  "besides",
  "between",
  "beyond",
  "but",
  "by",
  "can",
  "could",
  "do",
  "down",
  "during",
  "each",
  "except",
  "for",
  "from",
  "had",
  "has",
  "have",
  "he",
  "he'll",
  "her",
  "him",
  "his",
  "how",
  "I",
  "I'm",
  "if",
  "in",
  "inside",
  "into",
  "is",
  "it",
  "it's",
  "like",
  "many",
  "might",
  "must",
  "near",
  "next",
  "not",
  "of",
  "off",
  "on",
  "one",
  "onto",
  "opposite",
  "or",
  "other",
  "out",
  "outside",
  "over",
  "past",
  "per",
  "plus",
  "round",
  "said",
  "she",
  "should",
  "since",
  "so",
  "some",
  "than",
  "that",
  "the",
  "their",
  "them",
  "then",
  "there",
  "these",
  "they",
  "they'll",
  "they're",
  "this",
  "through",
  "till",
  "times",
  "to",
  "toward",
  "towards",
  "under",
  "unlike",
  "until",
  "up",
  "upon",
  "via",
  "was",
  "we",
  "we'll",
  "we're",
  "were",
  "what",
  "when",
  "which",
  "will",
  "with",
  "within",
  "without",
  "word",
  "won't",
  "worth",
  "would",
  "you",
  "you'll",
  "you're",
  "your"
]

# -------------------------------------------------------------------------------------------------
# helper methods

# figure out how many uniques
# if the script is triggered, it will always butt at least one word
module.exports = (robot) ->
  howManyButts = (size, replaceFreqDenom) ->
    Math.floor(size / replaceFreqDenom) + 1

# pick words to butt
  whichToButt = (uniques, numToButt) ->
    output = []
    while output.size() < numToButt
      nextButtIdx = Math.floor(Math.random * uniques.size())
      output = (output.concat uniques[nextButtIdx]).unique
    output



# main script runner
  buttify = (str, replaceFreqDenom) ->
    words = str.split(' ')
    uniques = words.unique
    
    # how many butts?
    numToButt = howManyButts(uniques.size(), replaceFreqDenom)

    # which will we butt?
    toButt = whichToButt(uniques, numToButt)

    # perform buttification

    # reform string
    words.join(' ')

# message must contain at least some word-like tokens that we can butt
  isStringButtable = (str) ->
    (str.search /[a-zA-Z]+/gi ) > 0

# determine whether we are to butt (check trigger and validate input)
  toButtOrNotToButt = (str, triggerFreqDenom) ->
    if (Math.floor(Math.random() * triggerFreqDenom) + 1) == 1
      isStringButtable(str)
    else
      false

# -------------------------------------------------------------------------------------------------
# the main Hubot method

  module.exports = (robot) ->

    # get env vars read into memory
    if triggerEnv
      frequencyDenom = parseInt(trigger_env)
    else
      frequencyDenom = DEFAULT_TRIGGER_FREQ_DENOM

    if replaceEnv
      replaceDenom = parseInt(replaceEnv)
    else
      replaceDenom = DEFAULT_REPLACE_FREQ_DENOM

    # match on all incoming strings
    robot.hear /(.+)/i, (msg) ->
      original = escape(msg.match[1]).trim.toLowerCase()
      if toButtOrNotToButt(original, frequencyDenom)
        butted = buttify(original, replaceDenom)
        msg.send butted 
