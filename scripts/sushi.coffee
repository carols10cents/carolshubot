# Remind us that sushi kim is closed on mondays.

module.exports = (robot) ->
  robot.hear /(sushi)/i, (msg) ->
    today = new Date().getDay();
    monday = 1;
    if (today == monday)
      msg.send "Nope, Sushi Kim is closed today."
