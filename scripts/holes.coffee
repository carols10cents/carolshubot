# Description:
#   Sam the onion man from holes
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   i can fix that - meme of sam with "i can fix that" text
#
# Author:
#   mjs072

module.exports = (robot) ->

  robot.hear /i can fix that/i, (msg) ->
    msg.send "http://aylinaksoy.com/blog/wp-content/uploads/sam-i-can-fix-that.png"