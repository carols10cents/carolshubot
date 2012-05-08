# Sports-related hubot tricks
#
# FANFEEDR_API_KEY

module.exports = (robot) ->
  robot.hear /(west virginia|wvu)/i, (msg) ->
    msg.reply "baaa-aaa-aaaa"

  robot.hear /(psu|penn state)/i, (msg) ->
    msg.reply "P-E-N-N-S-T SUCKS"

  robot.respond /sports test/i, (msg) ->
    msg.http("http://ffapi.fanfeedr.com/basic/api/leagues?")
      .query(api_key: process.env.FANFEEDR_API_KEY)
      .get() (err, res, body) ->
        results = JSON.parse(body)
        msg.reply "results = #{results.stringify}"