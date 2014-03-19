# Description:
#   Randomly replaces words with "butt"
#
# Commands
#   hubot butt me <sentence> - will buttify a given sentence
#
# Dependencies
#   "underscore": "1.3.3",
#
# Author
#   Justin Reese - @justinxreese

_          = require("underscore")

module.exports = (robot) ->
  # list of stopwords to ignore for butting
  stopwords = [ "a", "about", "above", "absent", "across", "after", "against",
  "all", "along", "among", "an", "and", "are", "around", "as", "at", "atop",
  "be", "before", "behind", "below", "beneath", "beside", "besides", "between",
  "beyond", "but", "by", "can", "could", "do", "down", "during", "each",
  "except", "for", "from", "had", "has", "have", "he", "he'll", "her", "him",
  "his", "how", "I", "I'm", "if", "in", "inside", "into", "is", "it", "it's",
  "like", "many", "might", "must", "near", "next", "not", "of", "off", "on",
  "one", "onto", "opposite", "or", "other", "out", "outside", "over", "past",
  "per", "plus", "round", "said", "she", "should", "since", "so", "some", "than",
  "that", "the", "their", "them", "then", "there", "these", "they", "they'll",
  "they're", "this", "through", "till", "times", "to", "toward", "towards",
  "under", "unlike", "until", "up", "upon", "via", "was", "we", "we'll", "we're",
  "were", "what", "when", "which", "will", "with", "within", "without", "word",
  "won't", "worth", "would", "you", "you'll", "you're", "your" ]

  # main script runner
  buttify = (str) ->
    words = _.uniq str.split(' ')
    words = _.difference words, stopwords
    word_to_butt = words[Math.floor(Math.random() * words.length)]
    re = new RegExp(word_to_butt,"g")
    return str.replace(re,"butt")

  non_butted_messages = 150
  chat_buttify = _.after non_butted_messages, buttify

  # Random butts
  robot.hear /(.+)/i, (msg) ->
    #result = chat_buttify(msg.match[1])
    #if result != undefined
    #  msg.send result
    #  chat_buttify = _.after non_butted_messages, buttify

  # On demand butts
  robot.respond /butt me (.*)/i, (msg) ->
    msg.send buttify(msg.match[1])
