-- Options
local opt = vim.opt

opt.clipboard = "unnamed,unnamedplus"
opt.guicursor = "i:block"
opt.signcolumn = "yes:1"
opt.termguicolors = true
opt.ignorecase = true
opt.swapfile = false
opt.autoindent = true
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.listchars = "tab: ,multispace:|   ,eol:󰌑"
opt.list = true
opt.number = true
opt.relativenumber = true
opt.wrap = true
opt.cursorline = true
opt.scrolloff = 8
opt.inccommand = "nosplit"
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.winborder = "rounded"
opt.hlsearch = false
opt.foldlevelstart = 99

--- Relative line numbering
function _G.line_numbering(lnum, relnum)
    local result

    if relnum == 0 then
        result = string.format("%d", lnum)
    else
        result = string.format("%d", relnum)
    end

    return result .. ' '
end

-- For future use
-- Absolute line numbers
function _G.abs_line_numbering(lnum, relnum)
    local result

    if relnum == 0 then
        result = ""
    else
        result = string.format("%d", lnum)
    end

    return result .. ' '
end

opt.statuscolumn = '%s%=%{v:virtnum > 0 ? "" : v:lua.line_numbering(v:lnum, v:relnum)}'

vim.cmd.filetype("plugin indent on")

vim.g.netrw_liststyle = 1
vim.g.netrw_sort_by = "size"

vim.diagnostic.config({ virtual_text = false })

require("vim._extui").enable({})
