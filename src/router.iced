module.exports = (app) ->
  app.get '/', (req, res) ->
    res.json 200, 
    status :
      name : "OK"
      data : []