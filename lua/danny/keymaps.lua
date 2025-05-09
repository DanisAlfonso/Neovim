-- ~/.config/nvim/lua/danny/keymaps.lua

-- Use visual line mode with j and k
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })

-- Move cursor by display lines when wrap is enabled
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "0", "g0", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "$", "g$", { noremap = true, silent = true })

-- Oil.nvim
vim.api.nvim_set_keymap("n", "<leader>o", ":Oil<CR>", { noremap = true, silent = true })

-- Keymap to call the word count function
vim.api.nvim_set_keymap(
	"n",
	"<leader>wc",
	':lua require("danny.wordcount").word_count()<CR>',
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>zm",
	':lua require("zen-mode").toggle(); vim.fn.system({"wezterm", "cli", "set-user-var", "ZEN_MODE", "+4"})<CR>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>ns", ":Noice telescope<CR>", { noremap = true, silent = true })

-- [[ Basic Keymaps ]]
-- Keymap to toggle NvimTree
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>da", "ggVGdi", { noremap = true, silent = true, desc = "Delete all contents" })
vim.keymap.set("n", "<leader>sa", "ggVG", { noremap = true, silent = true, desc = "Select all contents" })

vim.keymap.set(
	"i",
	"<C-f>",
	"<Right>",
	{ noremap = true, silent = true, desc = "Move cursor forward by one character" }
)

vim.keymap.set(
	"i",
	"<C-b>",
	"<Left>",
	{ noremap = true, silent = true, desc = "Move cursor backward by one character" }
)

vim.keymap.set("i", "jj", "<esc>la = ", { noremap = true, silent = true, desc = "Insert = with spaces at end" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Telescope keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>s/", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "[S]earch [/] in Open Files" })

vim.keymap.set("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

-- Toggleterm keymaps
vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>lua toggle_horizontal()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tv", "<cmd>lua toggle_vertical()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>lua toggle_float()<CR>", { noremap = true, silent = true })

-- Custom keymap to show the relative path of the current file
vim.api.nvim_set_keymap(
	"n",
	"<leader>fp",
	':lua print(vim.fn.fnamemodify(vim.fn.expand("%"), ":~:."))<CR>',
	{ noremap = true, silent = true }
)

-- Mapping to convert `--` to an em dash in insert mode
vim.api.nvim_set_keymap(
	"i",
	"--",
	"<C-v>u2014",
	{ noremap = true, silent = true, desc = "Convert `--` to an em dash (`—`)" }
)

-- Keep ;; mapping as a convenient alternative to Escape
vim.keymap.set('i', ';;', '<Esc>', { noremap = true, desc = "Alternative escape from insert mode" })

-- Add quick access to the cheatsheet
vim.api.nvim_set_keymap(
	"n", 
	"<leader>?c", 
	":e ~/.config/nvim/cheatsheet.txt<CR>", 
	{ noremap = true, silent = true, desc = "Open Neovim Cheatsheet" }
)


