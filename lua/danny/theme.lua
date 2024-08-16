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

-- Setup TokyoDark theme
local tokyodark_theme = {
	"tiagovla/tokyodark.nvim",
	opts = {
		-- custom options here
	},
	config = function(_, opts)
		require("tokyodark").setup(opts) -- calling setup is optional
		vim.cmd([[colorscheme tokyodark]])

		-- Enable transparency
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		print("Using TokyoDark theme with transparency")
	end,
}

-- Setup Aurora theme
local aurora_theme = {
	"ray-x/aurora",
	init = function()
		vim.g.aurora_italic = 1
		vim.g.aurora_transparent = 1
		vim.g.aurora_bold = 1
	end,
	config = function()
		vim.cmd.colorscheme("aurora")
		-- override defaults
		vim.api.nvim_set_hl(0, "@number", { fg = "#e933e3" })
		print("Using Aurora theme with custom highlights")
	end,
}

-- Setup NeoSolarized theme
local neosolarized_theme = {
	"Tsuzat/NeoSolarized.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		vim.cmd([[colorscheme NeoSolarized]])
		print("Using NeoSolarized theme")
	end,
}

-- Select which theme to use
local theme = neosolarized_theme -- Change this to `flow_theme`, `tokyodark_theme`, `aurora_theme`, `solarized_osaka_theme`, or `neosolarized_theme` to use the respective theme by default

return theme
