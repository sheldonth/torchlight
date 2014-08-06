sys = require('sys')
exec = require('child_process').exec;

fileDescriptorCommand = 'lsof -a -i 4 -c tor -n'

exports.torconnections = class torconnections
  
  constructor : ({@pollInterval}) ->
    
  
  pollConnections : () =>
    await
      child = exec fileDescriptorCommand, defer error, stdout, stderr
    if error?
      return "error: " + error
    else if stdout?
      return "stdout: " + stdout
    else if stderr?
      return "stderr: " + stderr