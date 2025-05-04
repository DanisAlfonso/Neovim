return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("fzf-lua").setup({
      -- Setup fzf binary path
      fzf_bin = "fzf",
      -- Use fd for file listing
      files = {
        fd_opts = "--color=never --type f --hidden --follow --exclude .git",
      },
      -- Configure winopts
      winopts = {
        height = 0.85,
        width = 0.80,
        row = 0.35,
        border = "rounded",
      },
      keymap = {
        -- These keys are supported by the builtin previewer
        builtin = {
          ["<C-d>"] = "preview-page-down",
          ["<C-u>"] = "preview-page-up",
        },
      },
    })
  end,
} 