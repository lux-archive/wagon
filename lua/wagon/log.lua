
local PROMPT = "[wagon]"

local function log(line)
  print(PROMPT .. " " .. line)
end

do
  local ok, color = pcall(require, 'ansicolors')
  if ok then
    PROMPT = color "%{yellow bright}[wagon]%{reset}"
  end
end

return log

