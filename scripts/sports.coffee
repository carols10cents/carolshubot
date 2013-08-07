# sports related taunts
#

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
    msg.reply "PITT BEAT DUKE"