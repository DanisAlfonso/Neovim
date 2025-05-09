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

-- Setup Monokai Nightasty theme
local monokai_nightasty_theme = {
	"polirritmico/monokai-nightasty.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		vim.cmd("colorscheme monokai-nightasty")
	end,
}

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
	end,
}

-- Setup NeoSolarized theme
local neosolarized_theme = {
	"Tsuzat/NeoSolarized.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		vim.cmd([[colorscheme NeoSolarized]])
	end,
}

-- Setup TokyoNight theme
local tokyonight_theme = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "night", -- The theme comes in four styles: "storm", "moon", "night" and "day"
		transparent = true, -- Enable this to disable setting the background color
		terminal_colors = true, -- Configure the colors used when opening a `:terminal`
		styles = {
			-- Style to be applied to different syntax groups
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
			-- Background styles. Can be "dark", "transparent" or "normal"
			sidebars = "transparent",
			floats = "transparent",
		},
		-- Set dim_inactive to true to dim inactive windows
		dim_inactive = false,
		-- Enable this to use the lualine_bold option
		lualine_bold = true,
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd([[colorscheme tokyonight]])
	end,
}

-- Select which theme to use
local theme = tokyonight_theme -- Change this to `kanagawa_theme`, `monokai_nightasty_theme`, `flow_theme`, `tokyodark_theme`, `aurora_theme`, `solarized_osaka_theme`, or `neosolarized_theme` to use the respective theme by default

return theme
