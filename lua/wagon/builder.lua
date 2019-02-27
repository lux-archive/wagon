
local FS  = require 'wagon.fs'
local LOG = require 'wagon.log'
local DEFS = require 'wagon.defs'

local BUILDER = {}

function BUILDER.isWagonBuilt()
  return FS.isDir(DEFS.WAGON_DIR)
end

function BUILDER.buildWagon()
  LOG.write "Building wagon..."
  FS.createDir(DEFS.WAGON_DIR)
  FS.createDir(DEFS.ROCKTREE_DIR)
  local config_contents = DEFS.CONFIG:format(FS.fullPath(DEFS.ROCKTREE_DIR))
  FS.createFile(DEFS.CONFIG_FILE, config_contents)
end

function BUILDER.findNearest()
  repeat
    if FS.isDir(WAGON_DIR) then
      return true
    end
  until not FS.changeToParentDir()
  return false
end

return BUILDER

