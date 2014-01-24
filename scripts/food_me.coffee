# Description:
#  Get the latest post from Yimmy's Deli on facebook, usually today's specials.
#
# Dependencies:
#   None
#
# Configuration:
#   FACEBOOK_ACCESS_TOKEN
#
# Commands:
#   hubot yimmy me
#
# Author:
#   carols10cents

module.exports = (robot) ->
  robot.hear /(pizza pizza)/i, (msg) ->
    msg.send "Did you want pizza? https://www.grubhub.com/pittsburgh/ephesus-pizza-pittsburgh/?showSmallSearchWidget=Y"

  robot.hear /(yimmy('?s)? me)/i, (msg) ->
    msg.http('https://graph.facebook.com/oauth/access_token')
       .query(
         client_id: process.env.FACEBOOK_CLIENT_ID,
         client_secret: process.env.FACEBOOK_CLIENT_SECRET,
         grant_type: 'client_credentials'
       )
       .get() (err, res, body) ->
         return msg.send "Sorry, Facebook oauth doesn't like you. ERROR: #{err}" if err
         return msg.send "Unable to get oauth response: #{res.statusCode + ':\n' + body}" if res.statusCode != 200
         access_token = body.match(/access_token=(.*)/)[1]
         msg.http('https://graph.facebook.com/yimmys.deli')
            .query(
              fields: 'posts.limit(1)',
              access_token: access_token
            )
            .get() (err, res, body) ->
              return msg.send "Sorry, Facebook doesn't like you. ERROR: #{err}" if err
              return msg.send "Unable to get response: #{res.statusCode + ':\n' + body}" if res.statusCode != 200
              graph_data = JSON.parse(body)
              posted_date = new Date(graph_data.posts.data[0].created_time)
              msg.send "Posted on #{posted_date}:"
              msg.send graph_data.posts.data[0].message
