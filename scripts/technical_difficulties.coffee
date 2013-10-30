# Description:
#   Technology is hard. Sometimes things go wrong, and who's to say why.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   technical difficulties - display a graphic showing possible problems
#
# Author:
#   brianstanwyck

td = [
  "http://www.bronxbanterblog.com/wordpress/wp-content/uploads/2011/11/technical-difficulties.jpg",
  "http://2.bp.blogspot.com/-Ot9dXtK-9M4/UiS3CN2WKrI/AAAAAAAACGs/KKzAaa6MZg4/s1600/unicorn-of-technical-difficulties%5B1%5D.jpg",
  "http://www.mikeburger.com/td-simpsons-bird.jpg",
  "http://imagemacros.files.wordpress.com/2010/02/roger_american_dad_technical_problems.png",
  "http://fc01.deviantart.net/fs70/f/2011/122/3/6/technical_difficulties_dalek_by_moon_manunit_42-d3ff5os.png",
  "http://i.imgur.com/Wj3Do.gif",
  "http://2.bp.blogspot.com/-UrqrIb-DSSg/TXeqiXJrEiI/AAAAAAAACe8/ZWqeZwQwyD8/s1600/Technical-Difficulties.jpg",
  "http://bassadelic.files.wordpress.com/2012/09/please-bear-with-us.gif",
  "http://www.adgjmp.net/technical_difficulties.png",
  "http://ttm-public.s3.amazonaws.com/static/3f04.jpg",
  "http://ttm-public.s3.amazonaws.com/static/1f03.jpg"
]

module.exports = (robot) ->
  robot.hear /technical difficulties/i, (msg)->
    msg.send msg.random td
