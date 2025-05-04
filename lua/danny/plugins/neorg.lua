return {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    ft = "norg",
    config = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes",
                            work = "~/work/notes",
                            personal = "~/personal/notes",
                        },
                        default_workspace = "notes",
                    },
                },
            },
            -- Disable default keybindings to resolve conflicts
            configure_keybinds = false,
        })

        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2

        -- Add custom keybindings
        local neorg_callbacks = require("neorg.core.callbacks")
        
        neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
            -- Map keybinds for Neorg mode
            keybinds.map_event_to_mode("norg", {
                n = {
                    -- Avoid conflicting keys by using unique combinations
                    -- Todo items
                    { "<leader>nu", "core.qol.todo_items.todo.task-undone" },
                    { "<leader>nd", "core.qol.todo_items.todo.task-done" },
                    { "<leader>np", "core.qol.todo_items.todo.task-pending" },
                    { "<leader>nh", "core.qol.todo_items.todo.task-on-hold" },
                    { "<leader>nc", "core.qol.todo_items.todo.task-cancelled" },
                    { "<leader>nr", "core.qol.todo_items.todo.task-recurring" },
                    { "<leader>ni", "core.qol.todo_items.todo.task-important" },
                    { "<leader>na", "core.qol.todo_items.todo.task-ambiguous" },
                    
                    -- Lists
                    { "<leader>nli", "core.pivot.list.invert" },
                    { "<leader>nlt", "core.pivot.list.toggle" },
                    
                    -- Other
                    { "<leader>nm", "core.looking-glass.magnify-code-block" },
                    { "<leader>ndt", "core.tempus.insert-date" },
                    
                    -- Table of contents
                    { "<leader>no", "core.ui.toggle-toc" },
                },
                i = {
                    -- Use a less common keybind for next-iteration
                    { "<C-n><C-i>", "core.itero.next-iteration" },
                },
            }, { silent = true, noremap = true })
        end)
    end,
} 