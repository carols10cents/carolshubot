# Description:
#   CAROLIZE
#
# Commands:
#   hubot Carol me <text> - Makes.the.statement.very.stacatto.by.adding.periods.between.all.words

module.exports = (robot) ->
  robot.respond /carol me (.*)/i, (msg) ->
    message = msg.match[1]
    msg.send message.replace(RegExp(" ", "g"), ".")
