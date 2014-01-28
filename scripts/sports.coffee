# when is the next steelers game?
# other sports related taunts

tz = require('timezone/loaded')
xpath = require('xpath')
dom = require('xmldom').DOMParser

module.exports = (robot) ->
  robot.hear /(notre dame|fighting irish)/i, (msg) ->
    msg.reply "hey remember when notre dame got embarrassed 42-14 in the national championship? LOLOLOL"

  robot.hear /(west virginia|wvu)/i, (msg) ->
    msg.reply "baaa-aaa-aaaa"

  robot.hear /(psu|penn state)/i, (msg) ->
    msg.reply "P-E-N-N-S-T SUCKS"

  robot.hear /(philly|philadelphia|flyers|eagles)/i, (msg) ->
    msg.reply "I believe you mean 'filthydelphia'"

  robot.hear /(cleveland|browns)/i, (msg) ->
    msg.reply "Cleveland still sucks"

  robot.hear /duke/i, (msg) ->
    msg.reply "Duke beat Pitt (okay)"

  robot.hear /\bplayoffs\b/i, (msg) ->
    msg.send "http://stream1.gifsoup.com/view/92512/mora-playoff-rant-o.gif"

  robot.hear /(when is the next steelers game|when do the steelers play( next)?)\??/i, (msg) ->
    nflLookup robot, msg, ''

nflLookup = (robot, msg, week_number_requested) ->
  robot.http("http://football.myfantasyleague.com/2013/export")
    .query({"TYPE": "nflSchedule", "L": "", "W": week_number_requested})
    .get() (err, res, body) ->
      nflParser robot, msg, body, week_number_requested

nflParser = (robot, msg, body, week_number_requested) ->
  doc = new dom().parseFromString(body)
  week_number_received = parseInt(xpath.select1("/nflSchedule/@week", doc).value)

  steelers_node = xpath.select1("//matchup[team[@id='PIT']]", doc)

  if steelers_node
    nflInterpret robot, msg, body, xpath, steelers_node, week_number_requested
  else
    msg.send "The Steelers have a bye this week."
    nflLookup robot, msg, week_number_received + 1

nflInterpret = (robot, msg, body, xpath, steelers_node, week_number_requested) ->
  game_seconds_remaining = xpath.select1("@gameSecondsRemaining", steelers_node).value

  if game_seconds_remaining == "0" && week_number_requested == ''
    nflLookup robot, msg, week_number_received + 1
  else
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