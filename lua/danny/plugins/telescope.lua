return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		-- Require necessary telescope modules
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")

		-- Define custom function to show current file relative path
		local function show_current_file_relative_path(prompt_bufnr)
			local current_picker = action_state.get_current_picker(prompt_bufnr)
			local entry = current_picker:get_selection()
			local file_path = vim.fn.fnamemodify(entry.value, ":~:.")
			print(file_path)
			actions.close(prompt_bufnr)
		end

		-- Telescope setup
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<leader>fp"] = show_current_file_relative_path,
					},
					n = {
						["<leader>fp"] = show_current_file_relative_path,
					},
				},
			},
			pickers = {},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		-- Load keymaps after telescope is configured
		require("danny.keymaps")
	end,
}
