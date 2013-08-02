# Description:
#   Shia Lebouf magic from SNL
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   magic - meme of shia with "magic" text
#
# Author:
#   machuga

module.exports = (robot) ->

  robot.hear /magic/i, (msg) ->
    msg.send "http://25.media.tumblr.com/tumblr_m3gzxnu8XZ1r4xouyo1_250.gif"
