
local log = require 'wagon.log'
local FS_INSPECTOR = require 'wagon.fsinspector'

local WAGON = {}

function WAGON.usage()
  print "Usage:"
  print "  $0 <command>"
  print "Available commands"
  print "  help build load drive"
end

function WAGON.init(version)
  -- Test if a wagon is built in the current directory
  if FS_INSPECTOR.hasWagon() then
    log "Wagon found"
  else
    log "Wagon not found"
  end
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

