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
#   \o/
#
# Author:
#   KAW

poopie_images = [
  "http://lib.store.yahoo.net/lib/yhst-11870311283124/pooped-brown.gif",
  "http://image.spreadshirt.com/image-server/v1/compositions/19197139/views/1,width=280,height=280,appearanceId=417.png/i-pooped-today-t-shirt_design.png",
  "http://www.wearmoretees.com/wp-content/uploads/2012/12/i-pooped-today-300x300.jpg",
  "http://www.feelingoodtees.com/Assets/ProductImages/POOPED_t.jpg"
]

module.exports = (robot) ->

  robot.hear /\\o\/|quinoa/i, (msg) ->
    msg.send msg.random poopie_images
