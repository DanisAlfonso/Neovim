-- Load options

require("danny.options")

-- Load word count function
local wordcount = require("danny.wordcount")

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("danny-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require("lazy").setup({
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	-- Use `opts = {}` to force a plugin to be loaded.
	-- This is equivalent to:
	-- require('Comment').setup({})

	-- "gc" to comment visual regions/lines
	-- Theme
	{ "numToStr/Comment.nvim", opts = {} },
	-- Here is a more advanced example where we pass configuration
	-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
	-- require('gitsigns').setup({ ... })
	--
	-- See `:help gitsigns` to understand what the configuration keys do
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	require("danny.plugins.debug"),
	require("danny.plugins.indent_line"),
	require("danny.plugins.lint"),
	require("danny.plugins.autopairs"),
	require("danny.plugins.neo-tree"),
	require("danny.plugins.noice"),
	require("danny.plugins.zen-mode"),
	require("danny.plugins.treesitter"),
	require("danny.plugins.which-key"),
	require("danny.plugins.todo-comments"),
	require("danny.plugins.markdown"),
	require("danny.plugins.oil"),
	require("danny.plugins.toggleterm"),
	require("danny.plugins.lazygit"),
	require("danny.plugins.telescope"),
	require("danny.plugins.lspconfig"),
	require("danny.plugins.conform"),
	require("danny.plugins.nvim-cmp"),
	require("danny.plugins.nvim-tree"),
	require("danny.plugins.lualine"),
	require("danny.plugins.lean"),
	require("danny.theme"),

	-- require 'danny.plugins.gitsigns', -- adds gitsigns recommend keymaps

	-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
	{ import = "custom.plugins" },
	require("custom.plugins.neorg"),
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
