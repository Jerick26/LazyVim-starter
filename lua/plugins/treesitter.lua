return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate", -- Command to run after installation to update parsers
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c",
                    "python",
                    "json",
                    "bash",
                    "yaml",
                    "lua",
                    "vim",
                    "javascript",
                    "markdown",
                    "markdown_inline",
                }, -- Add languages you want parsers for
                sync_install = false,
                auto_install = true, -- Automatically install missing parsers
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
            })
        end,
    },
}
