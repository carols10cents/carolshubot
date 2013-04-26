# put back the table

module.exports = (robot) ->
  robot.hear /(（╯°□°）╯︵ ┻━┻|put it back)/i, (msg) ->
    msg.send('┬──┬ ノ( ゜-゜ノ)')
