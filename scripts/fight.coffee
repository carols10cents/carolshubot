# Fighting
#
# What happens when someone orders a hubot to fight

module.exports = (robot) ->
  robot.respond /(fight|attack|hurt) ([\w.-]+)/i, (msg) ->
    msg.reply "Why would I want to do that? I'm a lover, not a fighter, and #{msg.match[2]} hasn't done anything to provoke me."

