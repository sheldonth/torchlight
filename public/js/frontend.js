var handlers, newConnection;

handlers = {
  "ConnectionCount": function(e) {
    return $('#node-count').html(e.value);
  }
};

newConnection = function() {
  var connection;
  connection = new WebSocket('ws://torchlight.sheldonth.com/ws/');
  connection.onopen = function() {
    return console.log("onopen");
  };
  connection.onerror = function(error) {
    console.log("onerror");
    return console.log(error);
  };
  connection.onmessage = function(e) {
    var event, handler;
    event = JSON.parse(e.data);
    console.log(event.event_type);
    console.log(event.value);
    if ((handler = handlers[event.event_type])) {
      return handler(event.value);
    }
  };
  return connection;
};

$(document).ready(function() {
  var websock;
  return websock = newConnection();
});
