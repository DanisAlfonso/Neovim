return {
  "MrPicklePinosaur/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("render-markdown").setup({
      -- Disable LaTeX support to fix the warnings
      latex = { 
        enabled = false 
      }
    })
  end,
} 