-- ~/.config/nvim/lua/danny/plugins/nvim-tree.lua
return {
	"nvim-tree/nvim-tree.lua",
	requires = {
		"nvim-tree/nvim-web-devicons", -- optional, for file icons
	},
	config = function()
		require("nvim-tree").setup({
			renderer = {
				highlight_opened_files = "all",
				highlight_git = true,
				icons = {
					show = {
						git = true,
						folder = true,
						file = true,
						folder_arrow = true,
					},
				},
			},
			view = {
				width = 30,
				side = "left",
			},
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")
				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- Default mappings
				api.config.mappings.default_on_attach(bufnr)

				-- Custom mappings
				vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
			end,
		})
	end,
}
