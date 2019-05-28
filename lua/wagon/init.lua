
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

function WAGON.install(rockspec_path)
  if rockspec_path then
    LOG.write("Loading rockspec '" .. rockspec_path .. "'")
    if BUILDER.goToNearestWagon() then
      return DRIVER.loadRockspec(rockspec_path)
    else
      return LOG.write "Could not find a wagon to load onto"
    end
  else
    LOG.write "Please specify a rockspec file"
  end
end

function WAGON.run(...) --luacheck: no unused
  -- Find nearest wagon
  -- Set up env vars
  -- Run command
  LOG.write "WIP"
end

return WAGON

