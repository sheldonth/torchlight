require 'coffee-script/register'

# CoffeeScript.register()

{spawn, exec} = require 'child_process'
{noisyExec} = require 'tafa-misc-util'

task 'run', () ->
    noisyExec "iced -cwo lib src"
    noisyExec "hotnode lib/server.js"
    
task 'compile', () ->
    noisyExec "iced -cwo lib src"