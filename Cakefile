require 'coffee-script/register'

# CoffeeScript.register()

{spawn, exec} = require 'child_process'
{noisyExec} = require 'tafa-misc-util'

task 'run', () ->
    noisyExec "iced -cwo lib src"
    noisyExec "iced -cwo public/js  src/frontend"
    # noisyExec "sass src/frontend/app.sass public/css/app.css"
    noisyExec "sass --watch src/frontend:public/css"
    noisyExec "hotnode lib/server.js"
    
task 'compile', () ->
    noisyExec "iced -co lib src"
    noisyExec "iced -co public/js  src/frontend"
    # noisyExec "sass src/frontend/app.sass public/css/app.css"
    # noisyExec "sass --watch src/frontend:public/css"