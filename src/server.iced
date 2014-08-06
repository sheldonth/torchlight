express = require 'express'
http = require 'http'
https = require 'https'
fs = require 'fs'
morgan = require 'morgan'
bodyparser = require 'body-parser'
cookieparser = require 'cookie-parser'
cookiesession = require 'cookie-session'
errorhandler = require 'errorhandler'

runApp = (db) ->
    console.log "process.cwd : #{process.cwd()}"
    console.log "__dirname : #{__dirname}"
    app = express()
    app.set 'port', 80
    app.locals.pretty = true
    # app.set 'view engine', 'jade'
    # app.set 'views', './src/views/'
    # app.use(express.static('./public'));
    app.use bodyparser.urlencoded extended: false
    app.use bodyparser.json()
    app.use cookieparser 'cookieparser'
    app.use cookiesession secret: 'cookiesecret'
    logFile = fs.createWriteStream './torchlight.log', {flags: 'a'} # //use {flags: 'w'} to open in write mode
    app.use morgan({format : 'default', stream : logFile})
    
