# when is the next steelers game?
#

tz = require('timezone/loaded')
xpath = require('xpath')
dom = require('xmldom').DOMParser

module.exports = (robot) ->
  robot.hear /(west virginia|wvu)/i, (msg) ->
    msg.reply "baaa-aaa-aaaa"

  robot.hear /(psu|penn state)/i, (msg) ->
    msg.reply "P-E-N-N-S-T SUCKS"

  robot.hear /when is the next steelers game?/i, (msg) ->
    msg.http("http://football.myfantasyleague.com/2012/export")
       .query({"TYPE": "nflSchedule", "L": "", "W": ""})
       .get() (err, res, body) ->
         doc = new dom().parseFromString(body)
         steelers_node = xpath.select1("//matchup[team[@id='PIT']]", doc)

         opponent_id = xpath.select1("team[not(@id='PIT')]/@id", steelers_node).value
         team = opponent_id

         kickoff = xpath.select1("@kickoff", steelers_node).value
         kdate = tz(parseInt(kickoff) * 1000)
         kdate_readable = tz(kdate, "%a %b %d @ %I:%M %P %Z", "en_US", "America/New_York")

         home_team = xpath.select1("team[@isHome='1']/@id", steelers_node).value

         if home_team == "PIT"
           home_or_away = "at home against #{team}"
         else
           home_or_away = "at #{team}"

         answer = "The Steelers next play on #{kdate_readable} #{home_or_away}."

         msg.send(answer)
