
local LOG = {}

local _prompt = "[wagon]"

do
  local ok, color = pcall(require, 'ansicolors')
  if ok then
    _prompt = color "%{yellow bright}[wagon]%{reset}"
  end
end

function LOG.write(line)
  return print(_prompt .. " " .. line)
end

function LOG.format(line)
  return function (...)
    return print(line:format(...))
  end
end

return LOG

