
local fs = require 'lfs'
local log = require 'wagon.log'

local WAGON_DIR = '.wagon'

local FS_INSPECTOR = {}

function FS_INSPECTOR.hasWagon(dir_path)
  dir_path = dir_path or fs.currentdir()
  local mode = fs.attributes(dir_path .. '/' .. WAGON_DIR, 'mode')
  return mode and mode == 'directory'
end

function FS_INSPECTOR.buildWagon(dir_path)
  -- If it isn't, build one from scratch:
  --  .wagon/
  --    rocktree/
  --    config.lua
  log "Building wagon..."
  log "WIP"
end

return FS_INSPECTOR

