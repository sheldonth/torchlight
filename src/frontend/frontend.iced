

handlers = 
  "ConnectionCount" : (e) ->
    $('#node-count').html e.value

newConnection = () ->
  connection = new WebSocket('ws://torchlight.sheldonth.com/ws/')

  connection.onopen = () ->
    console.log "onopen"
  
  connection.onerror = (error) ->
    console.log "onerror"
    console.log error
  
  connection.onmessage = (e) ->
    # console.log "onmessage" + e.data
    event = JSON.parse(e.data)
    console.log event.event_type
    console.log event.value
    if (handler = handlers[event.event_type])
      handler event.value
  
  return connection

$(document).ready ->
  websock = newConnection()
  
  