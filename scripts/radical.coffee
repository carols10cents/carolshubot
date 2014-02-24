# Description:
#   RADICAL RADICAL RADICAL
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   radical! | RADICAL | Rad! | rad!
#
# Author:
#   jnf

module.exports = (robot) ->

  robot.hear /radical!|Rad!|rad!/i, (msg) ->
    msg.send "https://lh3.googleusercontent.com/-6l46jk1gKhg/TyBWvyorEWI/AAAAAAAAdok/IIf9V2tjhtA/w500/tumblr_ly3u79fVSd1qlkly8-1.gif"