local M = {}

-- Function to count words in the current buffer
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

-- Function to count words in a given file
local function count_words_in_file(filepath)
	local word_count = 0
	for line in io.lines(filepath) do
		local _, wc = string.gsub(line, "%w+", "")
		word_count = word_count + wc
	end
	return word_count
end

return M
