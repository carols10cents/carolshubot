# Description:
#   Incrementally Draws the text sent exploiting hipchats s/thing/otherthing mechanism
#
# Commands:
#   hubot type me <string> - goes character by character typeing text
module.exports = (robot) ->
  robot.respond /type me (.*)/i, (msg) ->
    message = msg.match[1]
    length = message.length
    index = 1
    msg.send message.slice(0, index)
    setInterval (->
      msg.send(step message, ++index)
      clearInterval this  if index > length
    ), 300


    step = (str, index) ->
      oldMessage = str.slice(0,index-1)
      newMessage = str.slice(0,index)
      return "s/#{oldMessage}/#{newMessage}"
