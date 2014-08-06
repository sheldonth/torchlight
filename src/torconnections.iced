sys = require('sys')
exec = require('child_process').exec;

fileDescriptorCommand = 'lsof -a -i 4 -c tor -n'

exports.torconnections = class torconnections
  
  constructor : ({@pollInterval}) ->
    
  
  pollConnections : (callback) =>
    await
      child = exec fileDescriptorCommand, defer error, stdout, stderr
    if error?
      resString = "error: " + error
    else if stdout?
      resString = "stdout: " + stdout
    else if stderr?
      resString = "stderr: " + stderr
    callback resString