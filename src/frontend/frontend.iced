
newConnection = () ->
  connection = new WebSocket('ws://localhost:4002/ws/')

  connection.onopen = () ->
    console.log "onopen"
  
  connection.onerror = (error) ->
    console.log "onerror"
    console.log error
  
  connection.onmessage = (e) ->
    console.log "onmessage" + e.data
    console.log JSON.parse(event.data)
  
  return connection

$(document).ready ->
  websock = newConnection()
  
  