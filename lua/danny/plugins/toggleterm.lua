-- ~/.config/nvim/lua/danny/plugins/toggleterm.lua
return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<C-t>]], -- This is the new key mapping to toggle the terminal
			hide_numbers = true, -- Hide the number column in toggleterm buffers
			shade_filetypes = {},
			shade_terminals = false, -- Disable shading as we are using transparent.nvim for transparency
			start_in_insert = true,
			insert_mappings = true, -- Apply the open mapping in insert mode
			terminal_mappings = true, -- Apply the open mapping in the opened terminals
			persist_size = true,
			direction = "horizontal", -- Default direction, can be 'vertical', 'tab', or 'float'
			close_on_exit = true, -- Close the terminal window when the process exits
			shell = vim.o.shell, -- Change the default shell
			float_opts = {
				border = "rounded", -- Use rounded borders
				winblend = 0, -- Set transparency for the floating window
				highlights = {
					border = "FloatBorder",
					background = "NormalFloat",
				},
			},
		})

		-- Set terminal keymaps
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")

		-- Create custom functions to toggle terminals in different directions
		local Terminal = require("toggleterm.terminal").Terminal

		local horizontal_term = Terminal:new({ direction = "horizontal" })
		function _G.toggle_horizontal()
			horizontal_term:toggle()
		end

		local vertical_term = Terminal:new({ direction = "vertical" })
		function _G.toggle_vertical()
			vertical_term:toggle()
		end

		local float_term = Terminal:new({ direction = "float" })
		function _G.toggle_float()
			float_term:toggle()
		end
	end,
}
