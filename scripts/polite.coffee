# Polite.
#
# Say thanks to your robot.

responses = [
  "You're welcome.",
  "No problem.",
  "Anytime.",
  "That's what I'm here for!",
  "You are more than welcome.",
  "You don't have to thank me, I'm your loyal servant.",
  "Don't mention it."
]

shortResponses = [
  'vw',
  'np',
]

applesauce = [
  'http://www.simplyrecipes.com/wp-content/uploads/2008/10/applesauce-2.jpg',
  'http://www.zehnders.com/zblog/wp-content/uploads/2011/08/applesauce.jpg',
  'http://i.walmartimages.com/i/p/00/01/48/00/00/0001480000007_500X500.jpg',
  'http://www.tropicaltraditions.com/images/organic_applesauce.jpg',
  'http://images.iherb.com/l/OGB-00400-0.jpg',
  'http://thishappymom.com/wp-content/uploads/2012/09/applesauce.jpg',
  'http://media.treehugger.com/assets/images/2011/10/picture-red-green-diy-applesauce.jpg'
]

module.exports = (robot) ->
  robot.respond /(thanks|thank you|cheers|nice one)/i, (msg) ->
    msg.reply msg.random responses

  robot.respond /\b(ty|thx)\b/i, (msg) ->
    msg.reply msg.random shortResponses

  robot.respond /(<3)/i, (msg) ->
    if msg.message.user.name.match(/^(justinxreese|xjstin|mzalar)$/)
      msg.reply ":-*"
    else
      msg.reply "<3"

  robot.respond /\b(hello|hi|sup|howdy|good (morning|evening|afternoon))\b/i, (msg) ->
    msg.reply "#{robot.name} at your service!"

  robot.hear /^sorry$/i, (msg) ->
    msg.send "http://24.media.tumblr.com/87f8e1d7fb4a217d0cfe5222d66493ea/tumblr_mfgw9aQeNY1s1os2to1_400.jpg"

  robot.hear /\bholy\b/i, (msg) ->
    msg.send "https://s3.amazonaws.com/uploads.hipchat.com/44708/298888/3ascupxtalzpums/upload.png"

  robot.hear /^applesauce$/i, (msg) ->
    msg.reply msg.random applesauce

  robot.hear /\bbulletproof\b/, (msg) ->
    msg.send "http://24.media.tumblr.com/tumblr_lk3b2lx3Tb1qci3mxo1_500.gif"