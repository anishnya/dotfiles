-- Global Settings before loading
vim.g.mapleader = " "
vim.env.path = vim.env.VIM_PATH or vim.env.PATH
vim.g.format_on_save = false

require("plugins")
require("keymaps")
require("options")
require("autocommands")
