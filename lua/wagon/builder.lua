
local FS  = require 'wagon.fs'
local LOG = require 'wagon.log'

local WAGON_DIR     = '.wagon/'
local ROCKTREE_DIR  = WAGON_DIR .. 'rocktree/'
local CONFIG_FILE   = WAGON_DIR .. 'config.lua'

local CONFIG = [[
rocks_trees = {
  { name = 'user', root = '%s' }
}
]]

local BUILDER = {}

function BUILDER.isWagonBuilt()
  return FS.isDir(WAGON_DIR)
end

function BUILDER.buildWagon()
  LOG.write "Building wagon..."
  FS.createDir(WAGON_DIR)
  FS.createDir(ROCKTREE_DIR)
  FS.createFile(CONFIG_FILE, CONFIG:format(rocktree_path)) 
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

