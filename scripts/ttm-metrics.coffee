# Description:
#  TTM work related metrics/data/stats.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot how many teachers are online - returns the number of live teachers currently using production live teaching.
#
# Author:
#   carols10cents

module.exports = (robot) ->
  robot.respond /how many teachers are online/i, (msg) ->
    robot.http("https://live-teaching.thinkthroughmath.com/data/stats/teachers")
      .get() (err, res, body) ->
        return msg.send "Sorry, I couldn't tell :( ERROR: #{err}" if err
        content = JSON.parse(body)
        msg.send "#{content.teachers} teacher(s) online."
