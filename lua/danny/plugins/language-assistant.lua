return {
  dir = "/Users/danny/PJ/Lua/nvim-languages-assistant",  -- Use local path
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = true, -- Load on demand for faster startup
  cmd = {
    "LanguageExplain",
    "LanguageTranslate",
    "LanguageHistory",
    "LanguageExport"
  },
  keys = {
    { "<leader>le", mode = "v", desc = "Explain selection" },
    { "<leader>lt", mode = "v", desc = "Translate selection" },
    { "<leader>lh", desc = "Show language history" },
    { "<leader>lx", desc = "Export flashcards" },
  },
  config = function()
    require("languages-assistant").setup({
      -- API configuration
      api = {
        provider = "gemini", -- Using Gemini API by default
        gemini = {
          key_source = "env", -- Get API key from environment variable
          env_var_name = "GEMINI_API_KEY",
        }
      },
      
      -- Languages
      languages = {
        source = "en", -- Source language
        target = "es", -- Target language for translations
      },
      
      -- Custom keymaps
      keymaps = {
        enabled = true,
        prefix = "<leader>l",
      },
      
      -- Integration with other plugins
      integrations = {
        which_key = true, -- Integrate with which-key
      },
    })
  end,
} 