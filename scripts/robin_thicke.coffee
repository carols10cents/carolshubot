# Allows hubot to incorrectly to respond to mentions of Alan Thicke with
# Robin Thicke lyrics

module.exports = (robot) ->
  robot.hear /(alan thicke)/i, (msg) ->
      msg.send "hey hey hey"
