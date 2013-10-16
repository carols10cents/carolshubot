# Description:
#   Shia Lebouf magic from SNL
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   magic - meme of shia with "magic" text
#
# Author:
#   machuga

magic_images = [
  "http://25.media.tumblr.com/tumblr_m3gzxnu8XZ1r4xouyo1_250.gif",
  "https://s3.amazonaws.com/uploads.hipchat.com/44708/419874/gX4uwCHW54PgxaY/OscxZ4I.gif",
  "http://the-unexplained-world.com/wp-content/uploads/2013/08/history-channel-hd-aliens-thumb.jpg"
]

module.exports = (robot) ->

  robot.hear /magic/i, (msg) ->
    msg.send msg.random magic_images
