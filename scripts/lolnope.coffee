# Description:
#   tiny kitty tells you how it feels about your request
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   lolnope - respond appropriately to a request
#
# Author:
#   jnf

module.exports = (robot) ->

  robot.hear /lolnope/i, (msg) ->
    msg.send "http://i.imgur.com/6S2VJwz.jpg"
