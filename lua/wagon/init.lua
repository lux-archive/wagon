
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

function WAGON.init(version)
  -- Test if a wagon is built in the current directory
  -- If it isn't, build one from scratch:
  --  .wagon/
  --    rocktree/
  --    config.lua
  log "WIP"
end

function WAGON.install(rockspec_path)
  -- Find nearest rocktree
  -- Set up env vars
  -- Install all dependencies with luarocks locally
  log "WIP"
end

function WAGON.run(...)
  -- Find nearest rocktree
  -- Set up env vars
  -- Run command
  log "WIP"
end

return WAGON

