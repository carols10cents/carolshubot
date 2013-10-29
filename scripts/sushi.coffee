# Remind us that sushi kim and the warhol are closed on mondays.

module.exports = (robot) ->
  robot.hear /(sushi)/i, (msg) ->
    today = new Date().getDay();
    monday = 1;
    if (today == monday)
      msg.send "Nope, Sushi Kim is closed today."

  robot.hear /warhol/i, (msg) ->
    today = new Date().getDay();
    monday = 1;
    if (today == monday)
      msg.send "Nope, the Warhol is closed today."
