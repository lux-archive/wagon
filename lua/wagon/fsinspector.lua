
local fs = require 'lfs'
local log = require 'wagon.log'

local WAGON_DIR = '.wagon'

local FS_INSPECTOR = {}

function FS_INSPECTOR.hasWagon(dir_path)
  dir_path = dir_path or fs.currentdir()
  local mode = fs.attributes(dir_path .. '/' .. WAGON_DIR, 'mode')
  return mode and mode == 'directory'
end

return FS_INSPECTOR

