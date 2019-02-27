
local lfs = require 'lfs'

local LOG = require 'wagon.log'

local FS = {}

local _base_path = ""

function FS.setBasePath(path)
  _base_path = path .. "/"
end

function FS.isDir(path)
  path = _base_path .. path
  local mode = lfs.attributes(path, 'mode')
  return mode and mode == 'directory'
end

function FS.createDir(name)
  local path = _base_path .. name
  assert(lfs.mkdir(path))
  LOG.format "  created %s" (path)
end

function FS.createFile(name, contents)
  local path = _base_path .. name
  local file = io.open(path, 'w')
  file:write(contents)
  file:close()
  LOG.format "  created %s" (path)
end

return FS

