return {
    "Civitasv/cmake-tools.nvim",
    ft = { "cpp", "c", "h", "hpp", "cmake" },  -- Load only for relevant file types
    lazy = true,
    config = function()
        require("cmake-tools").setup({
            cmake_command = "cmake",
            cmake_build_directory = "build",
            cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
            cmake_build_options = {},
            cmake_console_size = 10,
            cmake_show_console = "always",
            cmake_dap_configuration = {
                name = "cpp",
                type = "codelldb",
                request = "launch",
            },
            cmake_variants_message = {
                short = { show = true },
                long = { show = true, max_length = 40 },
            },
        })
    end,
} 