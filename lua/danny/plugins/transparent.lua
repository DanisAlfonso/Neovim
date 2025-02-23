return {
    "xiyaowong/transparent.nvim",
    config = function()
        require("transparent").setup({
            groups = { -- default groups
                "Normal",
                "NormalNC",
                "Comment",
                "Constant",
                "Special",
                "Identifier",
                "Statement",
                "PreProc",
                "Type",
                "Underlined",
                "Todo",
                "String",
                "Function",
                "Conditional",
                "Repeat",
                "Operator",
                "Structure",
                "LineNr",
                "NonText",
                "SignColumn",
                "CursorLine",
                "CursorLineNr",
                "StatusLine",
                "StatusLineNC",
                "EndOfBuffer",
            },
            extra_groups = { -- additional groups for specific plugins and UI elements
                "NormalFloat", -- floating windows
                "FloatBorder", -- floating window borders
                "NvimTreeNormal", -- NeoTree
                "TelescopeNormal", -- Telescope plugin
                "LualineNormal", -- Lualine
                "TermNormal", -- Toggleterm normal terminals
                "TermFloat", -- Toggleterm floating terminals
            },
            exclude_groups = {}, -- groups to exclude from transparency
        })
    end,
} 