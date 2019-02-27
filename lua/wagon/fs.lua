
local lfs = require 'lfs'

local LOG = require 'wagon.log'

local FS = {}

function FS.isDir(path)
  local mode = lfs.attributes(path, 'mode')
  return mode and mode == 'directory'
end

function FS.changeDir(path)
  return lfs.chdir(path)
end

function FS.fullPath(path)
  return lfs.currentdir() .. "/" .. path
end

function FS.changeToParentDir()
  local lastdir = lfs.currentdir()
  assert(FS.changeDir('..'))
  return lfs.currentdir() ~= lastdir
end

function FS.createDir(name)
  assert(lfs.mkdir(name))
  LOG.format "  created %s" (name)
end

function FS.createFile(name, contents)
  local file = io.open(name, 'w')
  file:write(contents)
  file:close()
  LOG.format "  created %s" (name)
end

return FS

