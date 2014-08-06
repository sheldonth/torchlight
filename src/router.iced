{torconnections} = require './torconnections' 

module.exports = (app) ->
  torConnections = new torconnections 1
  
  app.get '/', (req, res) ->
    await
      torConnections.pollConnections defer resultString
    if resultString is "OK"
      res.json 200,
        status :
          name : "OK",
          connections : 
            length : torConnections.connections.length
            data : torConnections.connections
    else
      res.json 500,
        status : 
          name : "error"
          error : resultString
          