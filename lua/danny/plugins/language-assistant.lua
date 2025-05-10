return {
	"DanisAlfonso/language-assistant",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true, -- Load on demand for faster startup
	cmd = {
		"LanguageExplain",
		"LanguageTranslate",
		"LanguageHistory",
		"LanguageExport",
		"LanguageFlashcards",
		"LanguageFlashcardsBrowse",
		"LanguageHistoryToFlashcards",
		"LanguageInfo",
		"LanguageTest",
	},
	keys = {
		{ "<leader>le", mode = "v", desc = "Explain selection" },
		{ "<leader>lt", mode = "v", desc = "Translate selection" },
		{ "<leader>lh", desc = "Show language history" },
		{ "<leader>lx", desc = "Export flashcards" },
		{ "<leader>lf", desc = "Study flashcards" },
		{ "<leader>lb", desc = "Browse all flashcards" },
		{ "<leader>la", desc = "Convert history to flashcards" },
		{ "<leader>li", desc = "Show plugin info" },
	},
	config = function()
		require("languages-assistant").setup({
			-- API configuration
			api = {
				provider = "gemini", -- Using Gemini API by default
				gemini = {
					key_source = "env", -- Get API key from environment variable
					env_var_name = "GEMINI_API_KEY",
				},
			},

			-- Storage paths
			storage = {
				history_path = vim.fn.stdpath("data") .. "/languages_assistant_history.json",
				flashcards_path = vim.fn.stdpath("data") .. "/languages_assistant_flashcards.json",
				export_path = vim.fn.stdpath("data") .. "/languages_assistant_export.txt",
				auto_save = true,
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

			-- Flashcards configuration
			flashcards = {
				target_retention = 0.9, -- 90% target retention rate
				maximum_interval = 365, -- maximum interval in days
				learn_ahead_time = 0, -- Show only cards that are due
				fuzzy_intervals = true, -- randomize intervals slightly for better retention
				default_tags = { "language-learning" }, -- default tags for new cards
			},

			-- UI settings
			ui = {
				flashcards = {
					card_width = 80, -- Width of flashcard windows
					hide_scrollbar = true, -- Hide the scrollbar for cleaner UI
				},
			},

			-- Integration with other plugins
			integrations = {
				which_key = true, -- Integrate with which-key
				telescope = true, -- Add telescope integration if present
			},
		})
	end,
}

