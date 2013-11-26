# Description:
#   When fudge is what you say, but not what you mean. When fudge is typed, Mathbot will return with a Ralphie meme.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#  fudge
#
# Author:
#   Tim Bickerton

module.exports = (robot) ->
  robot.hear /fudge/i, (message) ->
    message.send "http://i.imgur.com/xOXauS5.jpg"
