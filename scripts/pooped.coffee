# Description:
#   I pooped today!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   \[ ]o[ ]/
#
# Author:
#   KAW

poopie_images = [
  "http://lib.store.yahoo.net/lib/yhst-11870311283124/pooped-brown.gif",
  "http://image.spreadshirt.com/image-server/v1/compositions/19197139/views/1,width=280,height=280,appearanceId=417.png/i-pooped-today-t-shirt_design.png",
  "http://www.wearmoretees.com/wp-content/uploads/2012/12/i-pooped-today-300x300.jpg",
  "http://www.feelingoodtees.com/Assets/ProductImages/POOPED_t.jpg",
  "http://fivefingertees.files.wordpress.com/2011/02/pooped2.jpg?w=300&h=300",
  "https://i.chzbgr.com/maxW500/5462479360/h7E0245F7/",
  "http://www.wordans.com/wvc-1384639671/wordansfiles/images/2013/11/16/226690/226690_340.jpg"
]

module.exports = (robot) ->

  robot.hear /\\[ ]*[o|O|0][ ]*\/|quinoa|asset pipeline/i, (msg) ->
    msg.send msg.random poopie_images
