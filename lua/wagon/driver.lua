
local BUNDLER = require 'wagon.bundler'

local DRIVER = {}

local _env = [[
LUA_PATH%ver="

]]

function DRIVER.run(command)
  local env = BUNDLER.bundle()
end

return DRIVER

