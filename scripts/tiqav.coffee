
module.exports = (robot) ->
  robot.respond /tiqav (.*)/i, (msg) ->
    key = encodeURIComponent msg.match[1]
    url = "http://api.tiqav.com/search.json"
    console.log url
    request = msg.http(url).query({q: key}).get()
    request (err, res, body) ->
      json = JSON.parse body
      i = Math.ceil(Math.random() * (json.length - 1))
      sourceUrl = json[i].source_url
      msg.send sourceUrl
