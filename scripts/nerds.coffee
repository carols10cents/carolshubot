module.exports = (robot) ->
  robot.hear /(access main program|access main security|access security|access security grid|access main program grid|access main security grid)/i, (msg) ->
    msg.send "http://gifsoup.com/webroot/animatedgifs6/2662404_o.gif"

  robot.hear /(D&D|DND)/i, (msg) ->
    msg.send "http://madnerds.ytmnd.com/"

  robot.hear /nerd/i, (msg) ->
    msg.send "http://www.ourhonordefend.com/wp-content/uploads/nerds.jpg"