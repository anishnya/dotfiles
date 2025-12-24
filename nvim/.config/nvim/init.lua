-- Global Settings before loading
vim.g.mapleader = " "
vim.env.path = vim.env.VIM_PATH or vim.env.PATH
vim.g.format_on_save = true
vim.g.no_plugin_maps = true

require("plugins")
require("keymaps")
require("options")
require("autocommands")
