{torconnections} = require './torconnections' 
{torconsensus} = require './torconsensus'
moment = require 'moment'
schedule = require 'node-schedule'

torConsensus = new torconsensus()

doRecursiveRead = () ->
  if process.env.production
    nextReadOperation = new schedule.scheduleJob torConsensus.freshUntilDate._d, () ->
      console.log "A read was made at:"
      console.log new Date()
      console.log "********"
      torConsensus.refresh doRecursiveRead
  else
    await torConsensus.refresh defer()

module.exports = (app) ->
  torConnections = new torconnections pollInterval: 1000
  app.set "torConnections", torConnections
  
  app.set "torConsensus", torConsensus
  await torConsensus.refresh defer()
  
  doRecursiveRead()
  
  app.get '/', (req, res) ->
    if torConnections.state is "OK"
      res.render 'home', 
        connections : torConnections.connections
        consensus : torConsensus
        time : moment(new Date())
        
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
          