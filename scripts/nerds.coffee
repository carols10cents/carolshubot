module.exports = (robot) ->
  robot.hear /(access main security grid)/i, (msg) ->
    msg.reply "http://gifsoup.com/webroot/animatedgifs6/2662404_o.gif"

  robot.hear /(D&D|DND)/i, (msg) ->
    msg.reply "http://madnerds.ytmnd.com/"

  robot.hear /nerd/i (msg) ->
    msg.reply "http://www.ourhonordefend.com/wp-content/uploads/nerds.jpg"