{torconnections} = require 'torconnections' 

module.exports = (app) ->
  torConnections = new torconnections 1
  
  app.get '/', (req, res) ->
    result = torConnections.pollConnections
    res.json 200, 
      status :
        name : "OK"
        data : result