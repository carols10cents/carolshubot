module.exports = (robot) ->

  robot.hear /make it work/i, (msg) ->
    msg.send "http://media-cache-ec3.pinterest.com/192x/81/b2/c8/81b2c81fc39f03acd517704dca9564a5.jpg"