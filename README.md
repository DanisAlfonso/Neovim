# Neovim Configuration

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

