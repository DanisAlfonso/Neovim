return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "bash", "c", "diff", "html", "lua", "luadoc", "markdown", "vim", "vimdoc" },
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "ruby" },
		},
		indent = { enable = true, disable = { "ruby" } },
	},
	config = function(_, opts)
		require("nvim-treesitter.install").prefer_git = true
		require("nvim-treesitter.configs").setup(opts)

		-- Associate .env.local files with bash syntax
		vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
			pattern = { ".env.local" },
			callback = function()
				vim.bo.filetype = "sh"
			end,
		})
	end,
}
