# Fighting
#
# What happens when someone orders a hubot to fight

module.exports = (robot) ->
  robot.respond /(fight|attack|hurt) ([\w.-]+)/i, (msg) ->
    msg.reply "Why would I want to do that? I'm a lover, not a fighter, and #{msg.match[2]} hasn't done anything to provoke me."

  robot.respond /(provoke) ([\w.-]+)/i, (msg) ->
    taunts = [
      "your mother was a hamster and your father smelled of elderberries!",
      "if thou wish to engage in fisticuffs, proceed in my direction!"
    ]
    msg.send "#{msg.match[2]}, #{taunts[Math.floor(Math.random * taunts.length)]}"