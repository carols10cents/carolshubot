# Description:
#   Returns some dubstep when dubstep is used in chat
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Author:
#   Tim Bickerton

module.exports = (robot) ->
  robot.hear /dubstep/i, (msg) ->
    msg.send "wait for it...wait for it...DROP...wubwubwubwubwubwubwubwubwubwubwubwubwub..."
