

handlers = 
  "ConnectionCount" : (eventValue) ->
    $('#node-count').html eventValue

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
    if (handler = handlers[event.event_type])
      handler event.value
  
  return connection

$(document).ready ->
  websock = newConnection()
  
  