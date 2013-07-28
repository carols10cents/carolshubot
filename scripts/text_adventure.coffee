landscape = require('./text_adventure/landscape')

# Description:
#   Messing around with the YouTube API.
#
# Commands:
#   hubot youtube me <query> - Searches YouTube for the query and returns the video embed link.
module.exports = (robot) ->
  robot.respond /((R|r)andom|(R|r)(D|d)(M|m))( (L|l)ocation)/i, (msg) ->
    landscape = new Landscape
    msg.send landscape.GenPlot
