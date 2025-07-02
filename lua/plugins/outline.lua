return {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { { "<leader>o", "<cmd>Outline<cr>", desc = "Toggle Outline" } },
    dependencies = { -- 添加这行
        "neovim/nvim-lspconfig", -- LSP 支持
        "nvim-treesitter/nvim-treesitter", -- Treesitter 支持
    },
    opts = function()
        local defaults = require("outline.config").defaults
        local opts = {
            symbols = {
                icons = {},
                filter = vim.deepcopy(LazyVim.config.kind_filter),
            },
            keymaps = {
                up_and_jump = "<up>",
                down_and_jump = "<down>",
            },
        }

        for kind, symbol in pairs(defaults.symbols.icons) do
            opts.symbols.icons[kind] = {
                icon = LazyVim.config.icons.kinds[kind] or symbol.icon,
                hl = symbol.hl,
            }
        end

        providers = {
            priority = { "lsp", "treesitter", "markdown" }, -- 指定提供程序优先级
            lsp = {
                -- 如果 LSP 服务器支持 hierarchicalDocumentSymbolSupport
                hierarchical_symbols = true,
            },
            treesitter = {
                -- 确保 Treesitter 已安装并启用
                enable = true,
            },
        }
        return opts
    end,
}
