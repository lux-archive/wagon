
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
    return LOG.info "Wagon is already built in the current directory"
  else
    return BUILDER.buildWagon()
  end
end

--- Installs all dependencies in the nearest wagon.
--  @param name rock name or path to the rockspec file stating the dependencies
function WAGON.install(name)
  if name then
    if BUILDER.goToNearestWagon() then
      if name:match("%.rockspec^") then
        LOG.info("Loading rockspect '%s'...", name)
        return DRIVER.loadRockspec(name)
      else
        LOG.info("Loading rock '%s'...", name)
        return DRIVER.loadRock(name)
      end
    else
      return LOG.info "Could not find a wagon to load onto"
    end
  else
    LOG.info "Please specify a rock name or rockspec file"
  end
end

function WAGON.run(...) --luacheck: no unused
  if BUILDER.goToNearestWagon() then
    return DRIVER.run(table.concat({ ... }, ' '))
  else
    return LOG.info "Could not find a wagon to run command with"
  end
end

return WAGON

