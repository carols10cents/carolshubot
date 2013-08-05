# Description:
#   Scrapes the first line from Wikipedia to try and resolve your Question
#
# Commands:
#   hubot What is <query> - Searches Wikipedia for the query and returns an abstract of the topic.
#   hubot Tell me about <query> - Searches Wikipedia for the query and returns an abstract of the topic.
module.exports = (robot) ->
  robot.respond /((W|w)hat (I|i)s|(T|t)ell (M|m)e (A|a)bout) (.*)/i, (msg) ->
    query = msg.match[7]
    msg.http("http://en.wikipedia.org/w/api.php")
      .query({
        action: "query"
        list: "search"
        format: 'json'
        srsearch: query
        srlimit: 1
        srprop: "snippet"
      })
      .get() (err, res, body) ->
        msg.send(results(body))


    results = (body, random=false) ->
      results = JSON.parse(body)
      if results.error
        return "ERRRRRRRRRRR"
      else
        results = results.query.search
        if results.length > 0
          result = results[0]
          link = "http://en.wikipedia.org/wiki/" + result.title.replace(" ", "_")
          snippet = result.snippet.replace(/<[^>]*>/g, "").replace('|','')
          return snippet + "\n" + link
        else
          return "Try again Cowboy I got nothing"
