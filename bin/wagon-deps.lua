--[[
--
--  Copyright (c) 2018 Wilson Kazuo Mizutani
--
--  Permission is hereby granted, free of charge, to any person obtaining a copy
--  of this software and associated documentation files (the "Software"), to
--  deal in the Software without restriction, including without limitation the
--  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
--  sell copies of the Software, and to permit persons to whom the Software is
--  furnished to do so, subject to the following conditions:
--
--  The above copyright notice and this permission notice shall be included in
--  all copies or substantial portions of the Software.
--
--  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
--  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
--  IN THE SOFTWARE.
--
--]]

local rockspec_path = ...

local INSTALL_CMD = [[
luarocks --local --tree=.rocktree install %s
]]

local lua_major, lua_minor = (function (a,b)
  return tonumber(a), tonumber(b)
end) (_VERSION:match "(%d+)%.(%d+)")

assert(lua_major >= 5, "Lua 5.1 or later required")

-- Load dependencies from rockspec
local spec = {}

if lua_minor == 1 then
  local chunk = assert(loadfile(rockspec_path))
  setfenv(charge, spec)
  chunk()
elseif lua_minor >= 2 then
  assert(loadfile(rockspec_path, 't', spec)) ()
end

for _,depstr in ipairs(spec.dependencies) do
  local rockname = depstr:match("^([^ ]+)")
  if rockname ~= 'lua' and rockname ~= 'luarocks' then
    local code = INSTALL_CMD:format(rockname)
    io.write(code)
    assert(os.execute(code), "Failed to install rock '"..rockname.."'")
  end
end

