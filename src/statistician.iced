

exports.statistician = class statistician
  constructor : ({@dataSet}) ->
    @subscribers = []
    if not @dataSet
      console.error "Cannot allocate statistician without DataSet"
  
  processDataSet : ({dataSet}) =>
    for sockets in @subscribers
      messageDict = 
        event : "ConnectionCount"
        value : dataSet.length
      sockets.text JSON.stringify(messageDict)
    
  subscribeSocket : (socket) =>
    @subscribers.push socket
  
  unsubscribeSocket : (socket) =>
    @subscribers.splice @subscribers.indexOf(socket), 1
  
