# Description:
#   Display a "deal with it" gif
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   deal with it - display a "deal with it" gif
#
# Author:
#   brianstanwyck

deal = [
  "http://i.imgur.com/ykDuU.gif",
  "http://i.imgur.com/3PWHn.gif",
  "http://i.imgur.com/sEinL.gif",
  "http://i.imgur.com/zsK7e.gif",
  "http://i.imgur.com/rE2aH.gif",
  "http://i.imgur.com/Wj3Do.gif",
  "http://assets0.ordienetworks.com/images/GifGuide/DealWithIt/dealwithitneti.gif",
  "http://assets0.ordienetworks.com/images/GifGuide/DealWithIt/_Deal_with_it_dog.gif",
  "http://assets0.ordienetworks.com/images/GifGuide/DealWithIt/30wphfo.jpg.gif",
  "http://assets0.ordienetworks.com/images/GifGuide/DealWithIt/Deal_with_it_Jerry_Seinfeld_what_s_the_deal_with_it.gif",
  "http://assets0.ordienetworks.com/images/GifGuide/DealWithIt/tumblr_l6ouy08TEp1qz9muno1_r1_400.gif",
  "http://assets0.ordienetworks.com/images/GifGuide/DealWithIt/tumblr_lh6sayYpIJ1qzaxefo1_400.gif",
  "http://assets0.ordienetworks.com/images/GifGuide/DealWithIt/bgdwee.gif",
  "http://assets0.ordienetworks.com/images/GifGuide/DealWithIt/dealwithitcat.gif",
  "http://assets0.ordienetworks.com/images/GifGuide/DealWithIt/ferrisdealwithit.gif"
]

module.exports = (robot) ->
  robot.hear /deal with it/i, (msg)->
    msg.send msg.random deal
