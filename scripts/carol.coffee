# Description:
#   CAROLIZE
#
# Commands:
#   hubot Carol me <text> - Makes.the.statement.very.stacatto.by.adding.periods.between.all.words

module.exports = (robot) ->
  robot.respond /((C|c)arol (M|m)e (.*))/i, (msg) ->
    message = msg.match[4]
    msg.send message.replace(RegExp(" ", "g"), ".")
