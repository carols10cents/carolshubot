#Provide for the general entertainment of the room

module.exports = (robot) ->
  robot.respond /(entertain me)/i, (msg) ->
    msg.reply "http://i.imgur.com/wuEPhF7.gif"

