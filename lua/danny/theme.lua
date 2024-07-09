-- Theme configuration for Neovim

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

if appearance == "dark" then
  return {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "dark"
    },
  }
else
  return {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "light"
    },
  }
end

