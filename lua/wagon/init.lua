
local LOG     = require 'wagon.log'
local BUILDER = require 'wagon.builder'

local WAGON = {}

function WAGON.usage()
  print "Usage:"
  print "  $0 <command>"
  print "Available commands"
  print "  help build load drive"
end

--- Builds wagon in the current directory if it isn't already there.
function WAGON.init()
  if BUILDER.isWagonBuilt() then
    return LOG.write "Wagon already built in current directory"
  else
    return BUILDER.buildWagon()
  end
end

function WAGON.install(rockspec_path)
  if BUILDER.findNearest() then
    -- Install all dependencies with luarocks locally
    LOG.write "WIP"
  else
    LOG.write "Could not find a wagon to load onto"
  end
end

function WAGON.run(...)
  -- Find nearest wagon
  -- Set up env vars
  -- Run command
  LOG.write "WIP"
end

return WAGON

