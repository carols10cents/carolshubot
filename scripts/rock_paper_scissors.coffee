# Description:
#   Play rock paper scissors
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot rock
#	hubot paper
#	hubot scissors
#
# Author:
#   TanookiMario

move = ["rock", "paper", "scissors"]

module.exports = (robot) ->
  robot.respond /(rock|paper|scissors)/i, (msg) ->
    msg.reply msg.random move