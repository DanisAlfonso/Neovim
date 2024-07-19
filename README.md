# Neovim Configuration

![Neovim Configuration](https://github.com/user-attachments/assets/3d3cf3f4-9fbb-455c-9885-7af3c4096e8d)

For some, myself included, it can be quite hard to fathom how one can devote so much time to playing around with a text editor, and yet, I must admit, it’s undoubtedly a charming form of procrastination. Many years ago, I delved into the world of Arch Linux, which is where I first dipped my toes into the waters of Vim; eventually, I migrated to Emacs, and now, for reasons that elude even me, I've found myself back in the embrace of Vim—Neovim, to be precise. While I do appreciate the sleek and modern features of contemporary text editors and IDEs, it seems that, in the absence of more pressing engagements, I am drawn back to these minimalist command-line tools. Perhaps it's the simplicity that appeals to me, or maybe it's just an excuse to avoid more important tasks, but either way, I find myself continually returning to this tinkering.

This repository contains my personal Neovim configuration file. Below is a summary of the settings and plugins included in the configuration.

## Key Features

- **Leader Key**: Set the space key as the leader key.
- **Nerd Font**: Configurable option to enable Nerd Font if installed.
- **Line Numbers**: Line numbers are enabled by default.
- **Mouse Mode**: Mouse mode is enabled for easier split resizing.
- **Clipboard Sync**: Syncs clipboard between OS and Neovim.
- **Undo History**: Saves undo history to an undo file.
- **Search Settings**: Case-insensitive search unless capital letters are used.
- **Split Management**: New splits open to the right and below by default.
- **Whitespace Characters**: Configures display for whitespace characters.
- **Cursorline**: Highlights the line your cursor is on.
- **Scrolloff**: Keeps a minimum number of screen lines above and below the cursor.
- **Highlight Yank**: Highlights text when yanking (copying) it.

## Basic Keymaps

- `<Esc>`: Clears search highlight.
- `<leader>da`: Deletes all contents.
- `<leader>sa`: Selects all contents.
- `[d` and `]d`: Navigates to previous and next diagnostic messages.
- `<leader>e`: Shows diagnostic error messages.
- `<leader>q`: Opens diagnostic quickfix list.
- `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`: Navigates between windows.

## Plugins

This configuration uses `lazy.nvim` as the plugin manager. Here are some of the key plugins included:

- **vim-sleuth**: Detects tabstop and shiftwidth automatically.
- **Comment.nvim**: Easily comment code.
- **transparent.nvim**: Adds transparency support.
- **catppuccin/nvim** and **onedarkpro.nvim**: Color schemes.
- **gitsigns.nvim**: Git integration.
- **which-key.nvim**: Displays available keybindings in a popup.
- **telescope.nvim**: Fuzzy finder for files, LSP, etc.
- **nvim-lspconfig**: Configures LSP servers.
- **conform.nvim**: Autoformatting.
- **nvim-cmp**: Autocompletion.
- **tokyonight.nvim**: Another color scheme.
- **todo-comments.nvim**: Highlights TODO comments.
- **mini.nvim**: Collection of small independent plugins.
- **nvim-treesitter**: Better syntax highlighting.

## Installation

To install this configuration, clone the repository and place the `init.lua` file in your Neovim configuration directory, usually located at `~/.config/nvim`.

```sh
git clone https://github.com/DanisAlfonso/nvim ~/.config/nvim

