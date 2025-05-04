return {
  "HakonHarnes/img-clip.nvim",
  event = "BufEnter",
  opts = {
    default = {
      -- Use the pngpaste executable we just installed
      paste_command = "/opt/homebrew/bin/pngpaste -",
      
      -- Directory where images will be saved
      save_dir = "assets/imgs",
      
      -- Format for the image file name
      template = "clip-%Y%m%d-%H%M%S.$ext$",
      
      -- Default dimensions
      max_width = 500,
      max_height = 500,
      
      -- Styling
      styling = {
        border = "rounded",
      },
    },
    
    filetypes = {
      -- Default for markdown files
      markdown = {
        template = "![${name}](${path})",
      },
    },
  },
} 