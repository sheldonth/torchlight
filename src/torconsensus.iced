# reads the from the series of plaintext information files cached to disk on a tor node.
# typically these files are in var/lib/tor

fs = require('fs')
lazy = require('lazy')
S = require('string')
moment = require('moment')
_ = require('underscore')
lineByLine = require('line-by-line')

consensusHeaderNumLines = 11

consensusNumberOfDirectories = 9

# r marvellous AAcif1htILdru0BO0qX7OwGVhAU dKf28RSoUCIkqHQ6tvCm6BvDLeE 2014-08-10 22:45:56 5.167.166.48 9001 0 <-- routeLine
# s Fast Running Valid <--flagLine
# v Tor 0.2.4.21 <-- versionLine
# w Bandwidth=143 <-- bandwidthLine
# p reject 1-65535 <-- policyLine

exports.tordirectorysig = class tordirectorysig
  constructor: (@signatureLine) ->

exports.torrouter = class torrouter
  constructor: (@routeLine) ->

exports.torauthority = class torauthority
  constructor: (@sourceLine) ->

# this class is a representation of the cached-consensus file
exports.torconsensus = class torconsensus
  constructor: () ->
    if process.env.production
      @filePath = "/var/lib/tor/cached-consensus" # path here is var/lib/tor/cached-consensus but this can only be read as root or debian-tor user
    else 
      @filePath = process.cwd() + "/tor/cached-consensus" #read a local copy of the data from the directory (not checked into source control)
    @creationDate = new Date()
    @refresh()
  
  refresh: () =>
    @lastConsensusReadDate = new Date()
    @readConsensus @filePath
    
  formattedKnownFlags = () =>
    fmtString = ""
    
  
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
    @readingFooter = no
    @readIndex = 0
    @routers = []
    @authorities = []
    lastAuthority = null
    lastRouter = null

    lr = new lineByLine path,
        encoding: 'utf8',
        skipEmptyLines: false
    
    lr.on 'error', (err) =>
      console.log "lr had " + err
      
    lr.on 'line', (line) =>
      sl = S(line)
      # is it less than the number of header lines
      if @readIndex < consensusHeaderNumLines
        result = @readHeaderLine line, @readIndex
      # is it's second character a string?
      else if line[1..1] is " "
        flagChar  = line[0..0]
        # console.log S(flagChar).length
        # process.stdout.write flagChar
        if flagChar is "r"
          lastRouter = new torrouter(routeLine:line)
        else if flagChar is "s"
          lastRouter.flagLine = line
        else if flagChar is "v"
          lastRouter.versionLine = line
        else if flagChar is "w"
          lastRouter.bandwidthLine = line
        else if flagChar is "p"
          lastRouter.policyLine = line
          @routers.push lastRouter
      # else, do the dir-source, contact, vote-digest dance
      else if sl.startsWith "bandwidth-heights"
        # @readingFooter = yes
        @bandwidthHeights = line.split " "        
      else
        # if it starts with dir-source then start a new authority object
        if sl.contains("dir-source")
          lastAuthority = new torauthority(sourceLine:line)
        else if sl.contains("contact")
          lastAuthority.contactLine = line
        else if sl.contains("vote-digest")
          lastAuthority.voteDigest = line
          @authorities.push lastAuthority
      @readIndex++
    
    lr.on 'end', () =>
      console.log "===> " + @authorities.length + " " + @routers.length
