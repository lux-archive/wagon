
local DEFS = {}

DEFS.WAGON_DIR     = '.wagon/'
DEFS.ROCKTREE_DIR  = WAGON_DIR .. 'rocktree/'
DEFS.CONFIG_FILE   = WAGON_DIR .. 'config.lua'

DEFS.CONFIG = [[
rocks_trees = {
  { name = 'user', root = '%s' }
}
]]

return DEFS

