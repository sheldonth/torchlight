{torconnections} = require './torconnections' 
{torconsensus} = require './torconsensus'

module.exports = (app) ->
  torConnections = new torconnections pollInterval: 1000
  app.set "torConnections", torConnections
  
  torConsensus = new torconsensus()
  app.set "torConsensus", torConsensus
  
  app.get '/', (req, res) ->
    if torConnections.state is "OK"
      res.render 'home', 
        connections : torConnections.connections
        consensus : torConsensus
        
  app.get '/ws', (req, res) ->
    res.send 200, "This endpoint is for ws:// only (HTML5 websocket)"
  
  app.get '/raw', (req, res) ->
    if torConnections.state is "OK"
      res.json 200,
        status :
          name : torConnections.state,
          connections : 
            length : torConnections.connections.length
            data : torConnections.connections
    else
      res.json 500,
        status : 
          name : "error"
          error : resultString
          