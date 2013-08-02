module.exports = (robot) ->

  robot.hear /make it work/i, (msg) ->
    msg.send "http://www.smpswisconsin.org/site/wp-content/uploads/2013/07/Make-it-Work.png"