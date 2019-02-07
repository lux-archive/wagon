
local PROMPT

do
  local ok, color = pcall('require', 'ansicolors')
  if ok then
    PROMPT = color "%{green bright}[wagon]%{reset}"
  else
    PROMPT = "[wagon]"
  end
end

local function log(line)
  print(PROMPT .. " " .. line)
end

local WAGON = {}

function WAGON.usage()
  print "Usage:"
  print "  $0 <command>"
  print "Available commands"
  print "  install help"
  print "Or, to load the wagon onto a local rocktree:"
  print "  source $0 load <lua version>"
end

function WAGON.rocktree(pwd)
  local rocktree = os.getenv('WAGON_ROCKTREE')
  if rocktree then
    print(rocktree)
  elseif pwd then
    print(pwd .. "/.rocktree")
  else
  end
end

return WAGON

