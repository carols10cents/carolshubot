module.exports = (robot) ->
  robot.hear /(access main program|access main security|access security|access security grid|access main program grid|access main security grid)/i, (msg) ->
    msg.send "http://gifsoup.com/webroot/animatedgifs6/2662404_o.gif"

  robot.hear /(D&D|DND)/i, (msg) ->
    msg.send "http://madnerds.ytmnd.com/"

  robot.hear /^nerds?$/i, (msg) ->
    msg.send "http://www.ourhonordefend.com/wp-content/uploads/nerds.jpg"

  robot.hear /^incredible?$/i, (msg) ->
    msg.send "http://i1339.photobucket.com/albums/o718/linkblaine/zack_meme_zps3553ac4a.jpg"

  robot.hear /^\(noidea\)$/, (msg) ->
    msg.send "http://cdn.memegenerator.net/instances/400x/35334325.jpg"

  robot.hear /cheese/, (msg) ->
    msg.send "CHEEEEESE http://stream1.gifsoup.com/view5/2774200/cheese-gromit-o.gif"