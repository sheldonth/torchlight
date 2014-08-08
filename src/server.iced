express = require 'express'
http = require 'http'
https = require 'https'
fs = require 'fs'
morgan = require 'morgan'
bodyparser = require 'body-parser'
cookieparser = require 'cookie-parser'
cookiesession = require 'cookie-session'
errorhandler = require 'errorhandler'
websocket = require 'websocket-driver'
router = require './router'

runApp = () ->
    console.log "process.cwd : #{process.cwd()}"
    console.log "__dirname : #{__dirname}"
    app = express()
    app.locals.pretty = true
    app.set 'view engine', 'jade'
    app.set 'views', './src/views/'
    app.use(express.static('./public'));
    app.use bodyparser.urlencoded extended: false
    app.use bodyparser.json()
    app.use cookieparser 'cookieparser'
    app.use cookiesession secret: 'cookiesecret'
    logFile = fs.createWriteStream './torchlight.log', {flags: 'a'} # //use {flags: 'w'} to open in write mode
    app.use morgan({format : 'default', stream : logFile})
    router app
    
    server = http.createServer(app).listen 4002, () ->
      console.log "HTTP Launched, Listening on 4002"
    
    server.on 'Upgrade', (request, socket, body) ->
      console.log "Upgrade"
      if not websocket.isWebSocket request
        return console.error "Bad Websocket Upgrade"
      driver = websocket.http request
      driver.io.write body
      socket.pipe(driver.io).pipe(socket)
      tc = app.get 'torConnections'
      driver.on 'open', (event) ->
        console.log "Websocket Open"
        tc.statistician.subscribeSocket driver
      driver.on 'close', (event) ->
        console.log "Websocket Close"
        tc.statistician.unsubscribeSocket driver
      driver.messages.on 'data', (message) ->
        console.log message
      driver.start()
    
runApp()