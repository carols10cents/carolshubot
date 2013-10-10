# Description:
#   Display one or more pictures of Beaker from the Muppets.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot beaker me - A randomly selected Beaker image
#   hubot beaker bomb <number> - Soooo many Beakers. Meep meep!
#
# Author:
#   jwrubel (built from dealwithit and kittens)

beaker = [
  "http://images4.wikia.nocookie.net/__cb20101015151248/muppet/images/0/05/Beaker.jpg",
  "http://images3.wikia.nocookie.net/__cb20120626193659/muppet/images/7/74/BeakerHands.jpg",
  "http://memecrunch.com/image/518172e5afa96f162000002d.jpg",
  "http://www.jimhillmedia.com/mb/images/upload/Bunsen-Beaker-web.jpg",
  "http://toughpigs.com/uploaded_images/beaker-fire-717642.jpg?9d7bd4",
  "http://3.bp.blogspot.com/-v4q0-r_PqwA/Ty75Ui2ejhI/AAAAAAAAJlM/dBEmMT033dg/s1600/Beaker.png",
  "http://26.media.tumblr.com/tumblr_l2afff3Wki1qbidvfo1_500.jpg",
  "http://images2.wikia.nocookie.net/__cb20071007065350/muppet/images/d/d4/Beaker_and_Wacky_WallWalkers.jpg",
  "http://i.ytimg.com/vi/Phyg_uIPQII/0.jpg",
  "http://www.themightyginge.com/blog/wp-content/uploads/2012/02/the_muppets_beaker.jpg",
  "http://www.maniacworld.com/muppets-do-rickroll.jpg",
  "http://images4.wikia.nocookie.net/__cb20120729071628/muppet/images/5/5d/BananaBeaker.JPG",
  "http://www.feistees.com/wp-content/uploads/2012/06/bkrmp.jpg",
  "http://www.winboard.org/attachments/witze-comics/63230d1354824356-beaker-von-den-muppets-mag-auch-kein-internet-explorer-beaker.png",
  "http://i1.ytimg.com/vi/EAtBki0PsC0/maxresdefault.jpg",
  "http://31.media.tumblr.com/89a9beea1b430dfb84f7a1aa134d49c1/tumblr_mg0z9qREJG1qbh26io1_1280.png",
  "http://farm3.staticflickr.com/2614/3877004502_dd685b6bbb_z.jpg",
  "http://assets.diylol.com/hfs/d5d/dac/3ff/resized/beaker-for-congress-meme-generator-meep-meep-meep-meep-meep-meep-meep-91a755.jpg",
  "http://www.epiclol.com/cdn/pictures/2012/06/justin-beaker_1338542678_epiclolcom.jpeg"
]

module.exports = (robot) ->
  robot.respond /beaker?(?: me)?$/i, (msg) ->
    msg.send msg.random beaker

  robot.respond /beaker bomb(?: me)?( \d+)?$/i, (msg) ->
    beakers = msg.match[1] || 3
    msg.send(msg.random beaker) for i in [1..beakers]
