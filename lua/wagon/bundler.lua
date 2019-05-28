
local DEFS = require 'wagon.defs'

local BUNDLER = {}

function BUNDLER.bundle()
  local version = DEFS.luaVersion()
  local major, minor = version.major, version.minor
  local version_folder = '/' .. major .. '.' .. minor
  local env = {}
  env.version = { major, minor }
  env.lua_paths = {
    DEFS.LUA_DIR .. version_folder .. "/?.lua",
    DEFS.LUA_DIR .. version_folder .. "/?/init.lua",
  }
  env.lib_paths = {
    DEFS.LIB_DIR .. version_folder .. "/?.so"
  }
  env.bin_paths = {
    DEFS.BIN_DIR
  }
  env.config_file = DEFS.CONFIG_FILE
  return env
end

return BUNDLER

