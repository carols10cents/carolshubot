# Description:
#   Koala Punch Oh Dear.  No koalas were harmed during the making of this gif.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   oh dear - gif of koala punch
#
# Author:
#   machuga

module.exports = (robot) ->

  robot.hear /oh dear/i, (msg) ->
    msg.send "http://i.imgur.com/CAH9jiG.gif"
