
local log = require 'wagon.log'

local WAGON = {}

function WAGON.usage()
  print "Usage:"
  print "  $0 <command>"
  print "Available commands"
  print "  install help"
  print "Or, to load the wagon onto a local rocktree:"
  print "  source $0 load <lua version>"
end

function WAGON.init()
  log "WIP"
end

function WAGON.install(rockspec_path)
  log "WIP"
end

function WAGON.run(...)
  log "WIP"
end

return WAGON

