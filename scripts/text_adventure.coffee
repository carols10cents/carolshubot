require('coffee-script')
assembler = require('./text_adventure/gen_assemble.coffee') # Cobbles Statements from structured arrays

# Description:
#   Location Plot Generator for Text Adventure Game
#
# Commands:
#   hubot Random location - Drums up a story line for your current location
#   hubot Where am I - Drums up a story line for your current location
#   hubot Look Around - Drums up a story line for your current location
#
#   hubot Monster Name - cobbles together a british sounding monster name

module.exports = (robot) ->
  robot.respond /(((R|r)andom|(R|r)(D|d)(M|m))( (L|l)ocation)|((W|w)here (A|a)m (I|i))|((L|l)ook (A|a)round))/i, (msg) ->
    landscape_data = require('./text_adventure/landscape.coffee') # location array
    landscape = new landscape_data.Landscape
    location = new assembler.GenAssembler(landscape.GetAVocab())
    msg.send location.Generate()

  robot.respond /((M|m)onster (N|n)ame)/i, (msg) ->
    monster_data = require('./text_adventure/monster_name.coffee') # monster name array
    monster = new monster_data.MonsterName

    monster_desc_data = require('./text_adventure/monster_desc.coffee')
    monster_desc = new monster_desc_data.MonsterDesc

    monster_name = new assembler.GenAssembler(monster.GetAVocab())
    monster_desc_text = new assembler.GenAssembler(monster_desc.GetAVocab())
    msg.send monster_name.Generate() + " - " + monster_desc_text.Generate()