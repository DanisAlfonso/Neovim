-- ~/.config/nvim/lua/danny/wordcount.lua
local M = {}

function M.word_count()
	local line_count = vim.fn.line("$")
	local word_count = 0
	for i = 1, line_count do
		local line = vim.fn.getline(i)
		local _, wc = string.gsub(line, "%w+", "")
		word_count = word_count + wc
	end
	print("Word count: " .. word_count)
end

return M
