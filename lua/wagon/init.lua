
local LOG     = require 'wagon.log'
local BUILDER = require 'wagon.builder'
local DRIVER  = require 'wagon.driver'

local WAGON = {}

function WAGON.usage()
  print "Usage:"
  print "  wagon <command>"
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

function WAGON.install(rockspec_path) --luacheck: no unused
  if BUILDER.goToNearestWagon() then
    DRIVER.run "luarocks --local --tree=.wagon/rocktree install wagon"
    -- Install all dependencies with luarocks locally
    LOG.write "WIP"
  else
    LOG.write "Could not find a wagon to load onto"
  end
end

function WAGON.run(...) --luacheck: no unused
  -- Find nearest wagon
  -- Set up env vars
  -- Run command
  LOG.write "WIP"
end

return WAGON

