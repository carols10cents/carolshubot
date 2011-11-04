# HAL
#
# Functionality of HAL from 2001: A Space Odyssey

module.exports = (robot) ->
  robot.respond /(open the pod bay doors)/i, (msg) ->
    msg.reply "I'm sorry, I'm afraid I can't do that."

