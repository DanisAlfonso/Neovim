return {
	-- Main Treesitter plugin
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"vim",
				"vimdoc",
				-- Add other languages as needed
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = {
				enable = true,
				disable = { "ruby" },
			},
		},
		config = function(_, opts)
			-- Prefer git for parser installation
			require("nvim-treesitter.install").prefer_git = true
			
			-- Use clang instead of gcc on macOS
			if vim.fn.has("macunix") == 1 then
				require("nvim-treesitter.install").compilers = { "clang", "gcc" }
			end

			-- Register the Ghostty parser
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.ghostty = {
				install_info = {
					url = "https://github.com/bezhermoso/tree-sitter-ghostty",
					files = { "src/parser.c" },
					branch = "main", -- Specify the correct branch name
				},
				filetype = "ghostty",
			}

			-- Setup Treesitter with the provided options
			require("nvim-treesitter.configs").setup(opts)

			-- Associate .env.local files with bash syntax
			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				pattern = { ".env.local" },
				callback = function()
					vim.bo.filetype = "sh"
				end,
			})

			-- Associate Ghostty config file with ghostty filetype
			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				pattern = { "*/.config/ghostty/config" },
				callback = function()
					vim.bo.filetype = "ghostty"
				end,
			})
		end,
	},

	-- Ghostty Treesitter grammar plugin
	{
		"bezhermoso/tree-sitter-ghostty",
		build = "make nvim_install",
	},
}
