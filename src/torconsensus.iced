# reads the from the series of plaintext information files cached to disk on a tor node.
# typically these files are in var/lib/tor

fs = require('fs')
lazy = require('lazy')
S = require('string')
moment = require('moment')
_ = require('underscore')
lineByLine = require('line-by-line')
geoip = require('geoip-lite')

consensusHeaderNumLines = 11

consensusNumberOfDirectories = 9

# r marvellous AAcif1htILdru0BO0qX7OwGVhAU dKf28RSoUCIkqHQ6tvCm6BvDLeE 2014-08-10 22:45:56 5.167.166.48 9001 0 <-- routeLine
# s Fast Running Valid <--flagLine
# v Tor 0.2.4.21 <-- versionLine
# w Bandwidth=143 <-- bandwidthLine
# p reject 1-65535 <-- policyLine

exports.tordirectorysig = class tordirectorysig
  constructor: (@signatureLine) ->
    # imagine the day we do a cryptographic validation of sigs here

# "r" SP nickname SP identity SP digest SP publication SP IP SP ORPort
#     SP DirPort NL
#     "Nickname" is the OR's nickname.  "Identity" is a hash of its
#     identity key, encoded in base64, with trailing equals sign(s)
#     removed.  "Digest" is a hash of its most recent descriptor as
#     signed (that is, not including the signature), encoded in base64.
#     "Publication" is the
#     publication time of its most recent descriptor, in the form
#     YYYY-MM-DD HH:MM:SS, in UTC.  "IP" is its current IP address;
#     ORPort is its current OR port, "DirPort" is its current directory
#     port, or "0" for "none".
# 
# "a" SP address ":" port NL
#     Present only if the OR has at least one IPv6 address.
# "s" SP Flags NL
#     A series of space-separated status flags, in lexical order (as ASCII
#     byte strings).  Currently documented flags are:
# 
#       "Authority" if the router is a directory authority.
#       "BadExit" if the router is believed to be useless as an exit node
#          (because its ISP censors it, because it is behind a restrictive
#          proxy, or for some similar reason).
#       "Exit" if the router is more useful for building
#          general-purpose exit circuits than for relay circuits.  The
#          path building algorithm uses this flag; see path-spec.txt.
#       "Fast" if the router is suitable for high-bandwidth circuits.
#       "Guard" if the router is suitable for use as an entry guard.
#       "HSDir" if the router is considered a v2 hidden service directory.
#       "Named" if the router's identity-nickname mapping is canonical,
#          and this authority binds names.
#       "Stable" if the router is suitable for long-lived circuits.
#       "Running" if the router is currently usable.
#       "Unnamed" if another router has bound the name used by this
#          router, and this authority binds names.
#       "Valid" if the router has been 'validated'.
#       "V2Dir" if the router implements the v2 directory protocol or
#          higher.
# 
# "v" SP version NL
# 
#     [At most once.]
# 
#     The version of the Tor protocol that this relay is running.  If
#     the value begins with "Tor" SP, the rest of the string is a Tor
#     version number, and the protocol is "The Tor protocol as supported
#     by the given version of Tor."  Otherwise, if the value begins with
#     some other string, Tor has upgraded to a more sophisticated
#     protocol versioning system, and the protocol is "a version of the
#     Tor protocol more recent than any we recognize."
# 
# "w" SP "Bandwidth=" INT [SP "Measured=" INT] [SP "Unmeasured=1"] NL
# 
#     [At most once.]
# 
#     An estimate of the bandwidth of this relay, in an arbitrary
#     unit (currently kilobytes per second).  Used to weight router
#     selection.
# 
#     Additionally, the Measured= keyword is present in votes by
#     participating bandwidth measurement authorities to indicate
#     a measured bandwidth currently produced by measuring stream
#     capacities. It does not occur in consensuses.
# 
#     The "Unmeasured=1" value is included in consensuses generated
#     with method 17 or later when the 'Bandwidth=' value is not
#     based on a threshold of 3 or more measurements.
# "p" SP ("accept" / "reject") SP PortList NL
# 
#     [At most once.]
# 
#     PortList = PortOrRange
#     PortList = PortList "," PortOrRange
#     PortOrRange = INT "-" INT / INT
# 
#     A list of those ports that this router supports (if 'accept')
#     or does not support (if 'reject') for exit to "most
#     addresses".
# 
#  "m" SP methods 1*(SP algorithm "=" digest) NL
# 
#     [Any number, only in votes.]
# 
#     Microdescriptor hashes for all consensus methods that an authority
#     supports and that use the same microdescriptor format.  "methods"
#     is a comma-separated list of the consensus methods that the
#     authority believes will produce "digest".  "algorithm" is the name
#     of the hash algorithm producing "digest", which can be "sha256" or
#     something else, depending on the consensus "methods" supporting
#     this algorithm.  "digest" is the base64 encoding of the hash of
#     the router's microdescriptor with trailing =s omitted.

exports.torrouter = class torrouter
  constructor: (@routerLine) ->
    components = @routerLine.split ' '
    @name = components[1]
    @origDateString = components[4] + ' ' + components[5]
    @IP = components[6]
    @geo = geoip.lookup(@IP)
    if @geo?
        @geoString = @geo.city + ', ' + @geo.country
    else
        @geoString = ''
    @onionPort = components[7]
    @directoryPort = components[8]
    
  setFlagLine: (flagLine) =>
    @flags = flagLine.split ' '
  
  setVersionLine: (versionLine) =>
    components = versionLine.split ' '
    @versionTitle = components[0]
    @versionNumber = components[1]
    
  setBandwidthLine: (@bandwidthLine) =>
    @bandwidthValue = @bandwidthLine.split('=')[1]
    
  setPolicyLine: (policyLine) =>
    components = policyLine.split ' '
    @policyType = components[1]
    @policyString = components[2]
    @policys = @policyString.split ','
    

#this class is a tor authority
# dir-source tor26 14C131DFC5C6F93646BE72FA1401C02A8DF2E8B4 86.59.21.38 86.59.21.38 80 443
  # "dir-source" SP nickname SP identity SP address SP IP SP dirport SP orport NL
  # As in the authority section of a vote.
# contact Peter Palfrader
  # arbitrary contact string
# vote-digest 3930FD0AA88AA30AEE24A4C87B8BD8E5E735D0C7
  # A digest of the vote from the authority that contributed to this
  # consensus, as signed (that is, not including the signature).
  # (Hex, upper-case.)

exports.torauthority = class torauthority
  constructor: (@sourceLine) ->
    sourceElements = @sourceLine.split ' '
    @nickname = sourceElements[1]
    @identity = sourceElements[2]
    @address = sourceElements[3]
    @IP = sourceElements[4]
    @dirPort = sourceElements[5]
    @orPort = sourceElements[6]
  
  setContactLine: (@contactLine) =>
    

  setVoteDigestLine: (@voteDigestLine) =>
    components = @voteDigestLine.split ' '
    @voteDigest = components[1]

# this class is a representation of the cached-consensus file
exports.torconsensus = class torconsensus
  constructor: () ->
    if process.env.production
      @filePath = "/var/lib/tor/cached-consensus" # path here is var/lib/tor/cached-consensus but this can only be read as root or debian-tor user
    else 
      @filePath = process.cwd() + "/tor/cached-consensus" #read a local copy of the data from the directory (not checked into source control)
    @creationDate = new Date()
  
  refresh: (cb) =>
    @lastConsensusReadDate = new Date()
    @readConsensus @filePath
    @callback = cb
    
  flagsString:  () =>
    str = ""
    for flag, index in @knownFlags
      str += @knownFlags[index] + ", "
    string = S(str).chompRight ", "
    return string.s
  
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
      console.error "LineReading had error:" + err
      
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
          lastRouter = new torrouter(line)
        else if flagChar is "s"
          lastRouter.setFlagLine line
        else if flagChar is "v"
          lastRouter.setVersionLine line
        else if flagChar is "w"
          lastRouter.setBandwidthLine line
        else if flagChar is "p"
          lastRouter.setPolicyLine line
          @routers.push lastRouter
      # else, do the dir-source, contact, vote-digest dance
      else if sl.startsWith "bandwidth-heights"
        # @readingFooter = yes
        @bandwidthHeights = line.split " "        
      else
        # if it starts with dir-source then start a new authority object
        if sl.contains("dir-source")
          lastAuthority = new torauthority(line)
        else if sl.contains("contact")
          lastAuthority.setContactLine line
        else if sl.contains("vote-digest")
          lastAuthority.setVoteDigestLine line
          @authorities.push lastAuthority
      @readIndex++
    
    lr.on 'end', () =>
        @callback()
        console.log "Authorities ===> " + @authorities.length + " Routers ===> " + @routers.length
