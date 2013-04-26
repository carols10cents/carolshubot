# Allows hubot to respond to the icona pop lyrics

module.exports = (robot) ->
  robot.hear /(i love it)/i, (msg) ->
      msg.send "I DON'T CARE!"

  robot.hear /(i)? (don't|dont)? (care)/i, (msg) ->
      msg.send "I Love it!"

