# Description:
#   TUMBLRIZE
#
# Commands:
#   hubot Tumblr me <text> - creates the next internet sensation

module.exports = (robot) ->
  robot.respond /tumblr me (.*)/i, (msg) ->
    message = msg.match[1]
    msg.send message+" dot tumblr dot com"
