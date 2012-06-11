module.exports = (robot) ->

  robot.hear /(^|\W)moo(\z|\W|$)/i, (msg) ->
    cow = [" _____", "< moo >", " -----", "        \\   ^__^", "         \\  (oo)\\_______", "            (__)\\       )\\/\\", "                ||----w |", "                ||     ||"]

    msg.send cow.join("\n")


