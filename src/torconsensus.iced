fs = require('fs')
lazy = require('lazy')
S = require('string')
moment = require('moment')
_ = require('underscore')

consensusHeaderNumLines = 11

consensusNumberOfDirectories = 9

exports.torconsensus = class torconsensus
  constructor: () ->
    if process.env.production
      @filePath = "/var/lib/tor/cached-consensus" # path here is var/lib/tor/cached-consensus but this can only be read as root or debian-tor user
    else 
      @filePath = process.cwd() + "/tor/cached-consensus" #read a local copy of the data from the directory (not checked into source control)
    @readConsensus @filePath
    @readDate = new Date()
  
  readHeaderLine: (line, lineNo) =>
    if lineNo is 0
      return @networkStatusVersion = S(line).right(1).s
    else if lineNo is 1
      return @voteStatus = line.split(" ")[1]
    else if lineNo is 2
      return @consensusMethod = line.split(" ")[1]
    else if lineNo is 3
      return @validAfterDate = moment(S(line).chompLeft("valid-after ").s)
    else if lineNo is 4
      return @freshUntilDate = moment(S(line).chompLeft("fresh-until ").s)
    else if lineNo is 5
      return @validUntilDate = moment(S(line).chompLeft("valid-until ").s)
    else if lineNo is 6
      return @votingDelayValues = line.split(" ")[1]
    else if lineNo is 7
      versionList = line.split(" ")[1]
      return @clientVersionList = versionList.split(",")
    else if lineNo is 8
      versionList = line.split(" ")[1]
      return @serverVersionList = versionList.split(",")
    else if lineNo is 9
      knownFlagsArray = line.split(" ")
      return @knownFlags = _.rest knownFlagsArray
    else if lineNo is 10
      paramsArray = line.split(" ")
      resDict = {}
      for param in _.rest paramsArray
        kv = param.split("=")
        key = kv[0]
        value = kv[1]
        resDict[key] = value
      return @params = resDict
      
  readConsensus: (path) =>
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
        else
          # if it starts with dir-source
          sl = S(line)
          if sl.contains "dir-source" or sl.contains "contact" or sl.contains "vote-digest"
            console.log "this"
            # we just started a directory, start a three line directory
            
          else
            console.log "that"
            # parse a current router
          
          # isInObject = no
          # parseAuthority @readHeaderLine % 3
          
        @readIndex++
