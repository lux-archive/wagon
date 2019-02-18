
local log = require 'wagon.log'
local FS_INSPECTOR = require 'wagon.fsinspector'

local WAGON = {}

function WAGON.usage()
  print "Usage:"
  print "  $0 <command>"
  print "Available commands"
  print "  help build load drive"
end

--- Builds wagon in the current directory if it isn't already there.
function WAGON.init(version)
  if FS_INSPECTOR.hasWagon() then
    return log "Wagon already found in current directory"
  else
    return FS_INSPECTOR.buildWagon()
  end
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

