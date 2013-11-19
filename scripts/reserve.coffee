# Description:
#   Reserve manages who is currently using shared resources
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   reservations - Show who has all the resources
#   who has the [resource name] - Show the current holder of a particular resource
#   is the [resource name] available - Yes if it's available, show who has it reserved if not
#   reserve the [resource name] - Reserve something
#   return the [resource name] - Return something you have checked out
#   force return the [resource name] - Return something anyone has checked out
#   stop taking reservations for the [resource name] - Clear out this resource so that it doesn't show up in the list

# Author:
#   carols10cents


class Reserver

  constructor: (@robot) ->
    @reservations = {}

    @robot.brain.on 'loaded', =>
      if @robot.brain.data.reservations
        @reservations = @robot.brain.data.reservations

  save: ->
    @robot.brain.data.reservations = @reservations

  allReservations: ->
    @reservations

  normalizeResource: (resource) ->
    resource.toLowerCase().trim()

  findReservation: (resource) ->
    @reservations[@normalizeResource(resource)]

  reserve: (resource, user) ->
    @reservations[@normalizeResource(resource)] = user
    @save()

  cancel: (resource) ->
    @reserve(resource, "(available)")

  clear: (resource) ->
    delete @reservations[@normalizeResource(resource)]
    @save()

  clearAll: ->
    @robot.brain.data.reservations = {}
    @save()


module.exports = (robot) ->
  reserver = new Reserver robot

  robot.respond /reservations/i, (msg) ->
    for resource, user of reserver.allReservations()
      msg.send "#{resource}: #{user}"

  robot.respond /who has (the )?(.*)/i, (msg) ->
    resource = msg.match[2]
    existingReservation = reserver.findReservation(resource)
    if !existingReservation || existingReservation == "(available)"
      msg.reply "No one does."
    else
      msg.reply "#{existingReservation}"

  robot.respond /is (the )?(.*) available\?/i, (msg) ->
    resource = msg.match[2]
    existingReservation = reserver.findReservation(resource)
    if !existingReservation || existingReservation == "(available)"
      msg.reply "Yes, it is."
    else
      msg.reply "Nope, #{existingReservation} has it."

  robot.respond /reserve (the )?(.*)/i, (msg) ->
    resource = msg.match[2]
    user     = msg.message.user.name

    existingReservation = reserver.findReservation(resource)

    if !existingReservation || existingReservation == "(available)"
      reserver.reserve(resource, user)
      msg.reply "It's all yours."
    else
      msg.reply "Sorry, that's currently reserved by #{existingReservation}. Please have them return it."

  robot.respond /(force )?return (the )?(.*)/i, (msg) ->
    resource = msg.match[3]
    user     = msg.message.user.name
    existingReservation = reserver.findReservation(resource)
    force    = msg.match[1]

    if existingReservation
      if existingReservation == user || force
        reserver.cancel(resource)
        msg.send "Now available: #{resource}!"
      else if existingReservation == "(available)"
        msg.send "You didn't have that reserved... no one did... sooo... it's available still!"
      else
        msg.reply "You can't; #{existingReservation} has it! Have them return it."
    else
      reserver.cancel(resource)
      msg.send "I don't know anything about that, sooo... it's available now!"

  robot.respond /stop taking reservations for (the )?(.*)/i, (msg) ->
    resource = msg.match[2]
    reserver.clear(resource)
    msg.send "Ok, no longer reservable: #{resource}"
