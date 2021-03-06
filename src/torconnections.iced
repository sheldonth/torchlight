# Reads the open file descriptors on the system using *nix lsof and parsing the result

## Formatted
# tor     2141 debian-tor    4u  IPv4 5124282      0t0  UDP *:60300 
# tor     2141 debian-tor    7u  IPv4  904593      0t0  TCP 127.0.0.1:9050 (LISTEN)
# tor     2141 debian-tor    9u  IPv4  904598      0t0  TCP *:9011 (LISTEN)
# tor     2141 debian-tor   10u  IPv4  904599      0t0  TCP *:9030 (LISTEN)
# tor     2141 debian-tor   11u  IPv4 5124283      0t0  UDP *:36283 
# tor     2141 debian-tor   13u  IPv4 6597946      0t0  TCP 173.255.196.30:9011->46.36.35.102:48981 (ESTABLISHED)
# tor     2141 debian-tor   14u  IPv4 6624103      0t0  TCP 173.255.196.30:9011->178.78.229.73:36300 (ESTABLISHED)
# tor     2141 debian-tor   15u  IPv4 6598201      0t0  TCP 173.255.196.30:9011->91.219.238.185:48765 (ESTABLISHED)
# tor     2141 debian-tor   16u  IPv4 6604226      0t0  TCP 173.255.196.30:9011->38.229.70.51:35748 (ESTABLISHED)
# tor     2141 debian-tor   17u  IPv4 6129033      0t0  TCP 173.255.196.30:9011->178.32.219.197:37459 (ESTABLISHED)
# tor     2141 debian-tor   18u  IPv4 6638105      0t0  TCP 173.255.196.30:33552->93.95.228.200:https (ESTABLISHED)
# tor     2141 debian-tor   19u  IPv4 6618801      0t0  TCP 173.255.196.30:42325->31.31.76.184:9001 (ESTABLISHED)
# tor     2141 debian-tor   20u  IPv4 6625262      0t0  TCP 173.255.196.30:9011->85.10.202.87:58425 (ESTABLISHED)
# tor     2141 debian-tor   21u  IPv4 6568749      0t0  TCP 173.255.196.30:9011->92.60.5.238:60647 (ESTABLISHED)


## Raw
cmdsample = "tor     2141 debian-tor    4u  IPv4 5124282      0t0  UDP *:60300 \ntor     2141 debian-tor    7u  IPv4  904593      0t0  TCP 127.0.0.1:9050 (LISTEN)\ntor     2141 debian-tor    9u  IPv4  904598      0t0  TCP *:9011 (LISTEN)\ntor     2141 debian-tor   10u  IPv4  904599      0t0  TCP *:9030 (LISTEN)\ntor     2141 debian-tor   11u  IPv4 5124283      0t0  UDP *:36283 \ntor     2141 debian-tor   13u  IPv4 6597946      0t0  TCP 173.255.196.30:9011->46.36.35.102:48981 (ESTABLISHED)\ntor     2141 debian-tor   14u  IPv4 6624103      0t0  TCP 173.255.196.30:9011->178.78.229.73:36300 (ESTABLISHED)\ntor     2141 debian-tor   15u  IPv4 6598201      0t0  TCP 173.255.196.30:9011->91.219.238.185:48765 (ESTABLISHED)\ntor     2141 debian-tor   16u  IPv4 6604226      0t0  TCP 173.255.196.30:9011->38.229.70.51:35748 (ESTABLISHED)\ntor     2141 debian-tor   17u  IPv4 6129033      0t0  TCP 173.255.196.30:9011->178.32.219.197:37459 (ESTABLISHED)\ntor     2141 debian-tor   18u  IPv4 6638105      0t0  TCP 173.255.196.30:33552->93.95.228.200:https (ESTABLISHED)\ntor     2141 debian-tor   19u  IPv4 6618801      0t0  TCP 173.255.196.30:42325->31.31.76.184:9001 (ESTABLISHED)\ntor     2141 debian-tor   20u  IPv4 6625262      0t0  TCP 173.255.196.30:9011->85.10.202.87:58425 (ESTABLISHED)\ntor     2141 debian-tor   21u  IPv4 6568749      0t0  TCP 173.255.196.30:9011->92.60.5.238:60647 (ESTABLISHED)\ntor     2141 debian-tor   22u  IPv4 6617284      0t0  TCP 173.255.196.30:9011->38.229.70.52:55645 (ESTABLISHED)\ntor     2141 debian-tor   23u  IPv4 6584532      0t0  TCP 173.255.196.30:47783->198.245.49.180:9001 (ESTABLISHED)\ntor     2141 debian-tor   24u  IPv4 6636103      0t0  TCP 173.255.196.30:52866->23.193.123.120:https (ESTABLISHED)\ntor     2141 debian-tor   25u  IPv4 6326233      0t0  TCP 173.255.196.30:9011->46.165.223.227:39367 (ESTABLISHED)\ntor     2141 debian-tor   26u  IPv4 4855583      0t0  TCP 173.255.196.30:49664->173.245.116.37:http (ESTABLISHED)\ntor     2141 debian-tor   27u  IPv4 6637495      0t0  TCP 173.255.196.30:33655->93.95.228.200:https (ESTABLISHED)\ntor     2141 debian-tor   28u  IPv4 6633855      0t0  TCP 173.255.196.30:42756->74.125.28.115:https (ESTABLISHED)\ntor     2141 debian-tor   29u  IPv4 6598212      0t0  TCP 173.255.196.30:9011->4.34.200.253:48275 (ESTABLISHED)\ntor     2141 debian-tor   30u  IPv4 6447444      0t0  TCP 173.255.196.30:9011->37.59.46.159:45589 (ESTABLISHED)\ntor     2141 debian-tor   31u  IPv4 6543649      0t0  TCP 173.255.196.30:55764->37.221.161.235:http-alt (ESTABLISHED)\ntor     2141 debian-tor   32u  IPv4 6616007      0t0  TCP 173.255.196.30:9011->31.31.75.84:54806 (ESTABLISHED)\ntor     2141 debian-tor   33u  IPv4 6637701      0t0  TCP 173.255.196.30:39818->180.149.59.137:https (ESTABLISHED)\ntor     2141 debian-tor   34u  IPv4 6535718      0t0  TCP 173.255.196.30:9011->80.237.208.100:46945 (ESTABLISHED)\ntor     2141 debian-tor   35u  IPv4 6596454      0t0  TCP 173.255.196.30:58051->46.105.17.164:9001 (ESTABLISHED)\ntor     2141 debian-tor   36u  IPv4 6604863      0t0  TCP 173.255.196.30:9011->95.128.43.164:35851 (ESTABLISHED)\ntor     2141 debian-tor   37u  IPv4 6637418      0t0  TCP 173.255.196.30:41094->74.125.224.32:https (ESTABLISHED)\ntor     2141 debian-tor   38u  IPv4 6636585      0t0  TCP 173.255.196.30:42268->74.125.224.208:https (ESTABLISHED)\ntor     2141 debian-tor   39u  IPv4 6636990      0t0  TCP 173.255.196.30:51798->87.98.216.34:9001 (ESTABLISHED)\ntor     2141 debian-tor   40u  IPv4 6598569      0t0  TCP 173.255.196.30:9011->107.182.19.222:44984 (ESTABLISHED)\ntor     2141 debian-tor   41u  IPv4 6602666      0t0  TCP 173.255.196.30:9011->81.4.110.214:43347 (ESTABLISHED)\ntor     2141 debian-tor   42u  IPv4 6610855      0t0  TCP 173.255.196.30:9011->88.198.51.82:53180 (ESTABLISHED)\ntor     2141 debian-tor   43u  IPv4 6630288      0t0  TCP 173.255.196.30:53377->188.165.229.195:9001 (ESTABLISHED)\ntor     2141 debian-tor   44u  IPv4 6598841      0t0  TCP 173.255.196.30:9011->176.9.47.150:14626 (ESTABLISHED)\ntor     2141 debian-tor   46u  IPv4 6638114      0t0  TCP 173.255.196.30:33561->93.95.228.200:https (ESTABLISHED)\ntor     2141 debian-tor   47u  IPv4 6424012      0t0  TCP 173.255.196.30:42579->144.76.199.40:49246 (ESTABLISHED)\ntor     2141 debian-tor   48u  IPv4 6637811      0t0  TCP 173.255.196.30:9011->38.229.0.29:50185 (ESTABLISHED)\ntor     2141 debian-tor   49u  IPv4 6081723      0t0  TCP 173.255.196.30:9011->195.191.233.222:25451 (ESTABLISHED)\ntor     2141 debian-tor   50u  IPv4 6629836      0t0  TCP 173.255.196.30:9011->91.121.82.16:48977 (ESTABLISHED)\ntor     2141 debian-tor   51u  IPv4 6638142      0t0  TCP 173.255.196.30:33589->93.95.228.200:https (ESTABLISHED)\ntor     2141 debian-tor   52u  IPv4 6634863      0t0  TCP 173.255.196.30:9011->91.219.237.110:56509 (ESTABLISHED)\ntor     2141 debian-tor   53u  IPv4 6633461      0t0  TCP 173.255.196.30:57409->173.194.46.6:http (ESTABLISHED)\ntor     2141 debian-tor   54u  IPv4 6635772      0t0  TCP 173.255.196.30:42160->74.125.224.63:https (ESTABLISHED)\ntor     2141 debian-tor   56u  IPv4 6638063      0t0  TCP 173.255.196.30:33561->63.238.2.248:http (ESTABLISHED)\ntor     2141 debian-tor   57u  IPv4 6630976      0t0  TCP 173.255.196.30:36165->108.28.81.201:https (ESTABLISHED)\ntor     2141 debian-tor   58u  IPv4 6633304      0t0  TCP 173.255.196.30:53954->74.125.224.251:http (ESTABLISHED)\ntor     2141 debian-tor   59u  IPv4 6607956      0t0  TCP 173.255.196.30:9011->162.243.228.43:48544 (ESTABLISHED)\ntor     2141 debian-tor   60u  IPv4 6617066      0t0  TCP 173.255.196.30:9011->91.121.170.106:45814 (ESTABLISHED)\ntor     2141 debian-tor   61u  IPv4 6614652      0t0  TCP 173.255.196.30:9011->18.82.3.196:35607 (ESTABLISHED)\ntor     2141 debian-tor   62u  IPv4 6478211      0t0  TCP 173.255.196.30:9011->37.221.195.65:38408 (ESTABLISHED)\ntor     2141 debian-tor   63u  IPv4 6637382      0t0  TCP 173.255.196.30:41698->74.125.224.193:https (ESTABLISHED)\ntor     2141 debian-tor   64u  IPv4 6600761      0t0  TCP 173.255.196.30:9011->77.247.181.163:16301 (ESTABLISHED)\ntor     2141 debian-tor   65u  IPv4 6636078      0t0  TCP 173.255.196.30:36984->96.47.226.22:https (ESTABLISHED)\ntor     2141 debian-tor   66u  IPv4 6396385      0t0  TCP 173.255.196.30:9011->144.76.182.202:56289 (ESTABLISHED)\ntor     2141 debian-tor   67u  IPv4 6635580      0t0  TCP 173.255.196.30:9011->151.60.138.0:49179 (ESTABLISHED)\ntor     2141 debian-tor   68u  IPv4 6621118      0t0  TCP 173.255.196.30:9011->94.142.245.201:33008 (ESTABLISHED)\ntor     2141 debian-tor   69u  IPv4 6632091      0t0  TCP 173.255.196.30:52626->174.140.140.39:http (ESTABLISHED)\ntor     2141 debian-tor   70u  IPv4 6637994      0t0  TCP 173.255.196.30:42381->209.94.144.19:http (ESTABLISHED)\ntor     2141 debian-tor   71u  IPv4 6617294      0t0  TCP 173.255.196.30:9011->37.187.247.150:34028 (ESTABLISHED)\ntor     2141 debian-tor   72u  IPv4 6621407      0t0  TCP 173.255.196.30:9011->188.214.26.32:42277 (ESTABLISHED)\ntor     2141 debian-tor   73u  IPv4 6544703      0t0  TCP 173.255.196.30:9011->188.165.213.156:37087 (ESTABLISHED)\ntor     2141 debian-tor   74u  IPv4 6633621      0t0  TCP 173.255.196.30:38644->23.218.156.194:https (ESTABLISHED)\ntor     2141 debian-tor   75u  IPv4 6597983      0t0  TCP 173.255.196.30:9011->151.236.7.177:42928 (ESTABLISHED)\ntor     2141 debian-tor   76u  IPv4 6631567      0t0  TCP 173.255.196.30:9011->78.94.51.153:51020 (ESTABLISHED)\ntor     2141 debian-tor   77u  IPv4 6478079      0t0  TCP 173.255.196.30:42440->77.95.231.11:https (ESTABLISHED)\ntor     2141 debian-tor   78u  IPv4 6618779      0t0  TCP 173.255.196.30:9011->78.46.93.178:58436 (ESTABLISHED)\ntor     2141 debian-tor   79u  IPv4 6426597      0t0  TCP 173.255.196.30:9011->88.198.9.16:36915 (ESTABLISHED)\ntor     2141 debian-tor   80u  IPv4 6602090      0t0  TCP 173.255.196.30:9011->176.31.152.159:43703 (ESTABLISHED)\ntor     2141 debian-tor   81u  IPv4 6308292      0t0  TCP 173.255.196.30:9011->62.210.82.177:37236 (ESTABLISHED)\ntor     2141 debian-tor   82u  IPv4 6629609      0t0  TCP 173.255.196.30:47482->31.13.66.96:https (ESTABLISHED)\ntor     2141 debian-tor   83u  IPv4 6613851      0t0  TCP 173.255.196.30:9011->89.163.224.187:43835 (ESTABLISHED)\ntor     2141 debian-tor   84u  IPv4 6549056      0t0  TCP 173.255.196.30:9011->141.212.108.13:7408 (ESTABLISHED)\ntor     2141 debian-tor   85u  IPv4 6630848      0t0  TCP 173.255.196.30:58734->67.197.104.171:1009 (ESTABLISHED)\ntor     2141 debian-tor   86u  IPv4 6637939      0t0  TCP 173.255.196.30:48996->8.26.205.253:http (ESTABLISHED)\ntor     2141 debian-tor   87u  IPv4 6579984      0t0  TCP 173.255.196.30:9011->192.87.28.28:62405 (ESTABLISHED)\ntor     2141 debian-tor   88u  IPv4 6049388      0t0  TCP 173.255.196.30:56456->122.99.114.29:imap2 (ESTABLISHED)\ntor     2141 debian-tor   89u  IPv4 6630844      0t0  TCP 173.255.196.30:9011->128.204.203.103:60766 (ESTABLISHED)\ntor     2141 debian-tor   90u  IPv4 6637496      0t0  TCP 173.255.196.30:33656->93.95.228.200:https (ESTABLISHED)\ntor     2141 debian-tor   91u  IPv4 6598033      0t0  TCP 173.255.196.30:9011->178.254.44.234:36647 (ESTABLISHED)\ntor     2141 debian-tor   92u  IPv4 6619292      0t0  TCP 173.255.196.30:9011->92.222.39.183:57103 (ESTABLISHED)\ntor     2141 debian-tor   93u  IPv4 6603769      0t0  TCP 173.255.196.30:9011->94.198.98.130:56832 (ESTABLISHED)\ntor     2141 debian-tor   94u  IPv4 6637993      0t0  TCP 173.255.196.30:60954->74.125.224.60:http (ESTABLISHED)\ntor     2141 debian-tor   95u  IPv4 6614808      0t0  TCP 173.255.196.30:9011->212.7.194.71:51929 (ESTABLISHED)\ntor     2141 debian-tor   96u  IPv4 6599984      0t0  TCP 173.255.196.30:9011->23.94.252.243:51575 (ESTABLISHED)\ntor     2141 debian-tor   97u  IPv4 6637703      0t0  TCP 173.255.196.30:45869->50.23.117.87:http (ESTABLISHED)\ntor     2141 debian-tor   98u  IPv4 6603895      0t0  TCP 173.255.196.30:47120->173.194.113.230:http (ESTABLISHED)\ntor     2141 debian-tor   99u  IPv4 6628098      0t0  TCP 173.255.196.30:49918->173.252.113.2:https (ESTABLISHED)\ntor     2141 debian-tor  100u  IPv4 6638143      0t0  TCP 173.255.196.30:33590->93.95.228.200:https (ESTABLISHED)\ntor     2141 debian-tor  101u  IPv4 6476338      0t0  TCP 173.255.196.30:9011->188.165.241.216:34193 (ESTABLISHED)\ntor     2141 debian-tor  102u  IPv4 6404313      0t0  TCP 173.255.196.30:9011->5.254.104.62:53553 (ESTABLISHED)\ntor     2141 debian-tor  103u  IPv4 6628440      0t0  TCP 173.255.196.30:53234->178.49.192.122:9001 (ESTABLISHED)\ntor     2141 debian-tor  104u  IPv4 6581870      0t0  TCP 173.255.196.30:9011->5.104.224.246:39351 (ESTABLISHED)\ntor     2141 debian-tor  105u  IPv4 6608646      0t0  TCP 173.255.196.30:43646->173.245.116.37:http (ESTABLISHED)\ntor     2141 debian-tor  106u  IPv4 6601080      0t0  TCP 173.255.196.30:9011->188.138.9.208:22231 (ESTABLISHED)\ntor     2141 debian-tor  107u  IPv4 6615465      0t0  TCP 173.255.196.30:9011->193.164.131.13:60426 (ESTABLISHED)\ntor     2141 debian-tor  108u  IPv4 6599600      0t0  TCP 173.255.196.30:9011->38.229.66.25:40689 (ESTABLISHED)\ntor     2141 debian-tor  109u  IPv4 6598097      0t0  TCP 173.255.196.30:9011->95.211.216.101:44366 (ESTABLISHED)\ntor     2141 debian-tor  110u  IPv4 6614764      0t0  TCP 173.255.196.30:9011->77.87.36.178:43681 (ESTABLISHED)\ntor     2141 debian-tor  111u  IPv4 6600627      0t0  TCP 173.255.196.30:9011->95.211.60.34:35255 (ESTABLISHED)\ntor     2141 debian-tor  112u  IPv4 6614603      0t0  TCP 173.255.196.30:9011->31.185.27.1:19638 (ESTABLISHED)\ntor     2141 debian-tor  113u  IPv4 6478914      0t0  TCP 173.255.196.30:9011->81.7.7.119:39888 (ESTABLISHED)\ntor     2141 debian-tor  114u  IPv4 6619322      0t0  TCP 173.255.196.30:33070->23.218.156.240:https (ESTABLISHED)\ntor     2141 debian-tor  115u  IPv4 6620981      0t0  TCP 173.255.196.30:45155->82.213.152.61:https (ESTABLISHED)\ntor     2141 debian-tor  116u  IPv4 6638106      0t0  TCP 173.255.196.30:33553->93.95.228.200:https (ESTABLISHED)\ntor     2141 debian-tor  117u  IPv4 6637744      0t0  TCP 173.255.196.30:9011->94.242.243.162:49751 (ESTABLISHED)\ntor     2141 debian-tor  118u  IPv4 6635573      0t0  TCP 173.255.196.30:39539->74.125.224.201:https (ESTABLISHED)\ntor     2141 debian-tor  119u  IPv4 6636661      0t0  TCP 173.255.196.30:58906->173.194.112.173:http (ESTABLISHED)\ntor     2141 debian-tor  120u  IPv4 6601690      0t0  TCP 173.255.196.30:9011->85.25.95.149:34511 (ESTABLISHED)\ntor     2141 debian-tor  121u  IPv4 6599510      0t0  TCP 173.255.196.30:9011->217.115.10.131:39290 (ESTABLISHED)\ntor     2141 debian-tor  122u  IPv4 6635201      0t0  TCP 173.255.196.30:9011->178.238.228.77:49311 (ESTABLISHED)\ntor     2141 debian-tor  123u  IPv4 6637508      0t0  TCP 173.255.196.30:57012->193.105.213.33:http (ESTABLISHED)\ntor     2141 debian-tor  124u  IPv4 6033840      0t0  TCP 173.255.196.30:9011->146.0.42.110:58225 (ESTABLISHED)\ntor     2141 debian-tor  125u  IPv4 6607669      0t0  TCP 173.255.196.30:9011->79.120.70.149:52443 (ESTABLISHED)\ntor     2141 debian-tor  126u  IPv4 6588813      0t0  TCP 173.255.196.30:9011->129.97.93.26:61166 (ESTABLISHED)\ntor     2141 debian-tor  127u  IPv4 6449584      0t0  TCP 173.255.196.30:9011->95.211.169.35:18287 (ESTABLISHED)\ntor     2141 debian-tor  128u  IPv4 6615687      0t0  TCP 173.255.196.30:9011->192.241.121.131:54693 (ESTABLISHED)\ntor     2141 debian-tor  129u  IPv4 6638098      0t0  TCP 173.255.196.30:33545->93.95.228.200:https (ESTABLISHED)\ntor     2141 debian-tor  130u  IPv4 6634998      0t0  TCP 173.255.196.30:34489->63.238.2.242:http (ESTABLISHED)\ntor     2141 debian-tor  131u  IPv4 6635313      0t0  TCP 173.255.196.30:39182->74.125.224.201:https (ESTABLISHED)\ntor     2141 debian-tor  132u  IPv4 6595438      0t0  TCP 173.255.196.30:9011->46.165.197.96:52489 (ESTABLISHED)\ntor     2141 debian-tor  133u  IPv4 6635528      0t0  TCP 173.255.196.30:57440->79.140.64.5:4433 (ESTABLISHED)\ntor     2141 debian-tor  134u  IPv4 6418033      0t0  TCP 173.255.196.30:9011->209.51.191.190:7746 (ESTABLISHED)\ntor     2141 debian-tor  135u  IPv4 6614698      0t0  TCP 173.255.196.30:9011->5.104.224.246:48722 (ESTABLISHED)\ntor     2141 debian-tor  136u  IPv4 6616482      0t0  TCP 173.255.196.30:9011->109.239.58.42:39628 (ESTABLISHED)\ntor     2141 debian-tor  137u  IPv4 6429085      0t0  TCP 173.255.196.30:9011->46.20.47.57:34592 (ESTABLISHED)\ntor     2141 debian-tor  138u  IPv4 6631190      0t0  TCP 173.255.196.30:55765->46.4.111.124:9001 (ESTABLISHED)\ntor     2141 debian-tor  139u  IPv4 6556856      0t0  TCP 173.255.196.30:9011->66.228.59.187:35963 (ESTABLISHED)\ntor     2141 debian-tor  140u  IPv4 6617149      0t0  TCP 173.255.196.30:9011->85.17.190.82:37088 (ESTABLISHED)"

sys = require('sys')
exec = require('child_process').exec;
geoip = require('geoip-lite')
ip = require ('ip')
{connectiontypes, exit_policy} = require './enums'
{statistician} = require './statistician'
fileDescriptorCommand = 'lsof -a -i 4 -c tor -n'
ORPort = 9011
myIP = "173.255.196.30"

# this string parsing sucks
exports.torconnection = class torconnection
  constructor : ({@ds}) ->
    @proto = @ds.substring(0, 3).trim()
    @pid = @ds.substring(8, 12).trim()
    @process_user = @ds.substring(13, 23).trim()
    @fd = @ds.substring(23, 29).trim()
    @type = @ds.substring(29, 35).trim()
    @device = @ds.substring(35, 43).trim()
    @size = @ds.substring(43, 52).trim()
    @node = @ds.substring(52, 57).trim()
    @name = @ds.substring(58, @ds.length).trim()
    splitPt = @name.indexOf ' '
    @state = @name.substring splitPt + 1, @name.length
    @connectionStatement = @name.substring 0, splitPt
    @origin = @connectionStatement.split("->")[0]
    if @origin 
      @originIP = @origin.split(":")[0]
    if @origin 
      @originPort = parseInt(@origin.split(":")[1])
    @destination = @connectionStatement.split("->")[1]
    if @destination 
      @destinationIP = @destination.split(":")[0]
    if @destination 
      @destinationPort = parseInt(@destination.split(":")[1])
    @geo = geoip.lookup(@destinationIP)
    if @originPort is ORPort and @originIP is ip.address()
      @connectionType=connectiontypes[0] #Exit
    else
      @connectionType=connectiontypes[1]

exports.torconnections = class torconnections
  constructor : ({@pollInterval}) ->
    @intervalTimer = setInterval () =>
      @pollConnections (str) =>
        @state = str
        if not @statistician
          @statistician = new statistician dataSet: @connections
        else
          @statistician.processDataSet dataSet: @connections
    , @pollInterval

  pollConnections : (callback) =>
    await
      child = exec fileDescriptorCommand, defer error, stdout, stderr
    if not process.env.production
      @parse cmdsample
      callback "OK"
      return
    if stdout?
      @parse stdout
      callback "OK"
      return
    else if error?
      # console.log error
      resString = "error: " + error
      callback resString
      return
    else if stderr?
      # console.log stderr
      resString = "stderr: " + stderr
      callback resString
      return
    
  parse : (str) =>
    resArray = str.split("\n")
    connectionsArr = []
    resArray.map (val) =>
      if val.length >= 85 #cutoff for other descriptors tor daemon keeps
        conn = new torconnection ds : val
        connectionsArr.push conn
    @connections = connectionsArr
      