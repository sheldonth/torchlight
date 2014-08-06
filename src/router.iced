{torconnections} = require './torconnections' 

module.exports = (app) ->
  torConnections = new torconnections 1
  
  app.get '/', (req, res) ->
    await
      torConnections.pollConnections defer resultString
    res.json 200,
      status :
        name : "OK",
        data : resultString