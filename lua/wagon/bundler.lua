
local BUNDLER = {}



function BUNDLER.bundle()
  local major, minor = _VERSION:match("(%d+)%.(%d+)")
  local env = {}
  env.version = { tonumber(major), tonumber(minor) }
  env.lua_paths
end

return BUNDLER

