# Description:
#   Sometimes thrid party code isn't as good as we'd like. No offense, we all
#   have different priorites, and at least it's free.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   ( seen | looked at ) their code - Sometimes thrid party code isn't as good
#   as we'd like
#
# Author:
#   Rob

reaction_images = [
  "http://i.imgur.com/qyg4E0i.gif"
  "http://i.imgur.com/542nUDY.gif"
  "http://i.imgur.com/n6cAODq.gif"
  "http://i.imgur.com/8ez7o7d.gif"
]

module.exports = (robot) ->
  robot.hear /((seen)|(looked at)).*their code/i, (msg) ->
    msg.send msg.random reaction_images
