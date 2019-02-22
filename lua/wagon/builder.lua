
local fs = require 'lfs'
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

function BUILDER.isWagonBuilt(dir_path)
  dir_path = dir_path and (dir_path .. "/") or ""
  local mode = fs.attributes(dir_path .. WAGON_DIR, 'mode')
  return mode and mode == 'directory'
end

local function _createDir(path)
  assert(fs.mkdir(path))
  LOG.format "  created %s" (path)
end

local function _createFile(path, contents)
  local file = io.open(path, 'w')
  file:write(contents)
  file:close()
  LOG.format "  created %s" (path)
end

function BUILDER.buildWagon(dir_path)
  dir_path = dir_path and (dir_path .. "/") or ""
  LOG.write "Building wagon..."

  local wagon_path    = dir_path .. WAGON_DIR
  local rocktree_path = dir_path .. ROCKTREE_DIR
  local config_path   = dir_path .. CONFIG_FILE

  _createDir(wagon_path)
  _createDir(rocktree_path)
  _createFile(config_path, CONFIG:format(rocktree_path)) 

  LOG.write "WIP"
end

return BUILDER

