# analyzes the current state of things and pushes deltas to websocket subscribers

exports.statistician = class statistician
  constructor : ({@dataSet}) ->
    @subscribers = []
    if not @dataSet
      console.error "Cannot allocate statistician without DataSet"
  
  processDataSet : ({dataSet}) =>
    for sockets in @subscribers
      messageDict = 
        event_type : "ConnectionCount"
        value : dataSet.length
      sockets.text JSON.stringify(messageDict)
    
  subscribeSocket : (socket) =>
    @subscribers.push socket
  
  unsubscribeSocket : (socket) =>
    @subscribers.splice @subscribers.indexOf(socket), 1
  
  # i4isTor : (i4Addr) ->
    
