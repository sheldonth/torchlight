// Generated by IcedCoffeeScript 1.7.1-f
(function() {
  var newConnection;

  newConnection = function() {
    var connection;
    connection = new WebSocket('ws://localhost:4002/ws/');
    connection.onopen = function() {
      return console.log("onopen");
    };
    connection.onerror = function(error) {
      console.log("onerror");
      return console.log(error);
    };
    connection.onmessage = function(e) {
      console.log("onmessage" + e.data);
      return console.log(JSON.parse(event.data));
    };
    return connection;
  };

  $(document).ready(function() {
    var websock;
    return websock = newConnection();
  });

}).call(this);
