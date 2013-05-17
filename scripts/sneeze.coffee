module.exports = (robot) ->
  robot.hear /(bless you)/i, (msg) ->
    msg.send "(lol) AAAAAAAAAAAAAAAAAAAAAAAAchooo"
    msg.send "(boom) AAAAAAAAAAAAAAAAAAAAAAAAchooo"

  robot.hear /a+choo+/i, (msg) ->
    msg.send "bless you!"

