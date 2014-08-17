fs = require('fs')
lazy = require('lazy')

exports.torconsensus = class torconsensus
  constructor: () ->
    if process.env.production
      @filePath = ""
    else
      @filePath = process.cwd() + "/tor/cached-consensus"
    @readConsensus @filePath
  
  readConsensus: (path) ->
    @readFileHeader = yes
    # await
    #   fs.readFile path, {encoding: "utf8"}, defer err, data
    # console.log data
    rs = fs.createReadStream(path)
    rs.setEncoding 'utf8'
    lazy(rs)
      .lines
      .map (String)
      .map (line) =>
        console.log "Line:"
        console.log line
    
