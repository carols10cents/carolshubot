# Description:
#   Probably a good idea.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#  good idea | could try | could work | might work - Probably a good idea
#
# Author:
#   Rob Wierzbowski

module.exports = (robot) ->
  robot.hear /(good idea)|(could try)|(could work)|(might work)/i, (message) ->
    message.send "http://i.imgur.com/GSMs0XC.jpg"
