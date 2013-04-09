module.exports = (robot) ->
  robot.hear /honk/i, (msg) ->
    msg.send "HoooonnnK"
    msg.send "Hoo----ooo---nnkkkkk"
    msg.send "HooonnnnNNKKKKKKK"
