{torconnections} = require './torconnections' 

module.exports = (app) ->
  torConnections = new torconnections pollInterval: 1000
  
  app.get '/', (req, res) ->
    if torConnections.state is "OK"
      res.render 'home', 
        connections : torConnections.connections
  
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
          