local loader      = require("utils.loader")

---@type lz.n.pack.Spec
local mini_pick   = {
    src = "https://github.com/nvim-mini/mini.pick",
    data = {
        "mini.pick",
        keys = {
            { '<leader>ff', function() require("mini.pick").builtin.files() end,     desc = "Find files" },
            { '<leader>fg', function() require("mini.pick").builtin.grep_live() end, desc = "Live grep" },
            { '<leader>fb', function() require("mini.pick").builtin.buffers() end,   desc = "Find buffers" },
            { '<leader>fh', function() require("mini.pick").builtin.help() end,      desc = "Find help tags" },
            { '<leader>fr', function() require("mini.pick").builtin.resume() end,    desc = "Resume last picker" },
        },
        after = function()
            require("mini.pick").setup({
                mappings = {
                    caret_left        = '<Left>',
                    caret_right       = '<Right>',

                    choose            = '<CR>',
                    choose_in_split   = '<C-s>',
                    choose_in_tabpage = '<C-t>',
                    choose_in_vsplit  = '<C-v>',
                    choose_marked     = '<C-q>',

                    delete_char       = '<BS>',
                    delete_char_right = '<Del>',
                    delete_left       = '<C-u>',
                    delete_word       = '<C-w>',

                    mark              = '<C-x>',
                    mark_all          = '<C-a>',

                    move_down         = '<C-n>',
                    move_start        = '<C-g>',
                    move_up           = '<C-p>',

                    paste             = '<C-r>',

                    refine            = '<C-Space>',
                    refine_marked     = '<M-Space>',

                    scroll_down       = '<C-f>',
                    scroll_left       = '<C-h>',
                    scroll_right      = '<C-l>',
                    scroll_up         = '<C-b>',

                    stop              = '<Esc>',

                    toggle_info       = '<S-Tab>',
                    toggle_preview    = '<Tab>',
                },
                window = {
                    config = function()
                        local height = math.floor(0.6 * vim.o.lines)
                        local width = math.floor(0.6 * vim.o.columns)
                        return {
                            relative = 'editor',
                            anchor = 'NW',
                            height = height,
                            width = width,
                            row = math.floor(0.5 * (vim.o.lines - height)),
                            col = math.floor(0.5 * (vim.o.columns - width)),
                            border = 'rounded',
                        }
                    end,
                }
            })
        end,
        lazy = false,
    }
}

---@type lz.n.pack.Spec
local mini_extras = {
    src = "https://github.com/nvim-mini/mini.extra",
    data = {
        "mini.extra",
        keys = {
            -- Extras
            { '<leader>fk', function() require("mini.extra").pickers.keymaps() end,                           desc = "Find keymaps" },
            { '<leader>fq', function() require("mini.extra").pickers.qflist() end,                            desc = "Find quickfix list" },
            { '<leader>ft', function() require("mini.extra").pickers.treesitter() end,                        desc = "Find Treesitter Nodes" },

            -- LSP Navigation
            { '<leader>gd', function() require("mini.extra").pickers.lsp({ scope = "definition" }) end,       desc = "Go to defintion" },
            { '<leader>gD', function() require("mini.extra").pickers.lsp({ scope = "declaration" }) end,      desc = "Go to declaration" },
            { '<leader>gi', function() require("mini.extra").pickers.lsp({ scope = "implementation" }) end,   desc = "Go to implementation" },
            { '<leader>gt', function() require("mini.extra").pickers.lsp({ scope = "type_definition" }) end,  desc = "Go to type definition" },

            -- LSP Findings
            { '<leader>gr', function() require("mini.extra").pickers.lsp({ scope = "references" }) end,       desc = "Find references" },
            { '<leader>go', function() require("mini.extra").pickers.lsp({ scope = "document_symbol" }) end,  desc = "Find document symbols" },
            { '<leader>gO', function() require("mini.extra").pickers.lsp({ scope = "workspace_symbol" }) end, desc = "Find workspace symbols" },
        },
        after = function()
            require('mini.extra').setup()
        end,
    }
}

loader.load_plugins(
    {
        {
            plug = mini_pick,
        },
        {
            plug = mini_extras,
        },
    }
)
