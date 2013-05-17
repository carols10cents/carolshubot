# sports related taunts
#

module.exports = (robot) ->
  robot.hear /(notre dame|fighting irish)/i, (msg) ->
    msg.reply "hey remember when notre dame got embarrassed 42-14 in the national championship? LOLOLOL"

  robot.hear /(west virginia|wvu)/i, (msg) ->
    msg.reply "baaa-aaa-aaaa"

  robot.hear /(psu|penn state)/i, (msg) ->
    msg.reply "P-E-N-N-S-T SUCKS"
