-- theme.lua

local function get_appearance()
	local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
	local result = handle:read("*a")
	handle:close()
	if result:match("Dark") then
		return "dark"
	else
		return "light"
	end
end

local appearance = get_appearance()
local theme_flavour = appearance == "dark" and "mocha" or "latte"

-- Setup Catppuccin theme
local theme = {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	opts = {
		flavour = theme_flavour, -- Mocha is the dark theme, Latte is the light theme
	},
	config = function()
		require("catppuccin").setup({
			flavour = theme_flavour,
		})
		vim.cmd("colorscheme catppuccin")
		print("Using Catppuccin theme with flavour: " .. theme_flavour)
	end,
}

return theme
