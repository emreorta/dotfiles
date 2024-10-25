# `core.keymaps` must be reloaded before lazy init due to mapleader

require("core.autocmds")
require("core.keymaps")
require("core.options")
require("core.lazy")

require("core.colorscheme")
