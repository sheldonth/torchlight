fs = require('fs')
lazy = require('lazy')
S = require('string')
moment = require('moment')

consensusHeaderNumLines = 11

exports.torconsensus = class torconsensus
  constructor: () ->
    if process.env.production
      @filePath = "" # path here is var/lib/tor/cached-consensus but this can only be read as root or debian-tor user
    else
      @filePath = process.cwd() + "/tor/cached-consensus"
    @readConsensus @filePath
  
  readHeaderLine: (line, lineNo) ->
    if lineNo is 1
      return @networkStatusVersion = S(line).right 1
    else if lineNo is 2
      return @voteStatus = line.split(" ")[1]
    else if lineNo is 3
      return @consensusMethod = line.split(" ")[1]
    else if lineNo is 4
      return @validAfterDate = moment line.splice(12, line.length)
      
      
      
  readConsensus: (path) ->
    @readFileHeader = yes
    @readIndex = 0
    # await
    #   fs.readFile path, {encoding: "utf8"}, defer err, data
    # console.log data
    rs = fs.createReadStream(path)
    rs.setEncoding 'utf8'
    lazy(rs)
      .lines
      .map (String)
      .map (line) =>
        if @readIndex < consensusHeaderNumLines
          result = @readHeaderLine line, @readIndex
          console.log result
        @readIndex++
