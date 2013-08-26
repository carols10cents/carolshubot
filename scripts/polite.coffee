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

module.exports = (robot) ->
  robot.respond /(thanks|thank you|cheers|nice one)/i, (msg) ->
    msg.reply msg.random responses

  robot.respond /(ty|thx)/i, (msg) ->
    msg.reply msg.random shortResponses

  robot.respond /(<3)/i, (msg) ->
    if msg.message.user.name.match(/^(justinxreese|xjstin|mzalar)$/)
      msg.reply ":-*"
    else
      msg.reply "<3"

  robot.respond /(hello|hi|sup|howdy|good (morning|evening|afternoon))/i, (msg) ->
    msg.reply "#{robot.name} at your service!"

  robot.hear /sorry/i, (msg) ->
    msg.send "http://24.media.tumblr.com/87f8e1d7fb4a217d0cfe5222d66493ea/tumblr_mfgw9aQeNY1s1os2to1_400.jpg"

  robot.hear /holy/i, (msg) ->
    msg.send "https://s3.amazonaws.com/uploads.hipchat.com/44708/298888/3ascupxtalzpums/upload.png"
