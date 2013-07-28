require('coffee-script')
landscape = require('./text_adventure/landscape.coffee')

# Description:
#   Location Plot Generator for Text Adventure Game
#
# Commands:
#   hubot Random location - Drums up a story line for your current location
#   hubot Where am I - Drums up a story line for your current location
module.exports = (robot) ->
  robot.respond /(((R|r)andom|(R|r)(D|d)(M|m))( (L|l)ocation)|((W|w)here (A|a)m (I|i)))/i, (msg) ->
    location = new landscape.Landscape
    msg.send location.GenPlot()