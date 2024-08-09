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

-- Setup Flow theme
local flow_theme = {
	"0xstepit/flow.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("flow").setup({
			transparent = true,
			fluo_color = "pink",
			mode = "normal",
			aggressive_spell = false,
		})
		vim.cmd("colorscheme flow")
		print("Using Flow theme")
	end,
}

-- Setup Solarized Osaka theme
local solarized_osaka_theme = {
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		vim.cmd("colorscheme solarized-osaka")
		print("Using Solarized Osaka theme")
	end,
}

-- Select which theme to use
local theme = flow_theme -- Change this to `solarized_osaka_theme` if you want to use the Solarized Osaka theme by default

return theme
