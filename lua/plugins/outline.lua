return {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { { "<leader>o", "<cmd>Outline<cr>", desc = "Toggle Outline" } },
    dependencies = { -- 添加这行
        "nvim-treesitter/nvim-treesitter", -- Treesitter 支持
        "mason-org/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig", -- LSP 支持
        "epheien/outline-ctags-provider.nvim",
    },
    config = function()
      require('outline').setup({
        providers = {
          priority = { "lsp", "markdown", "norg", "ctags", "treesitter",  }, -- 指定提供程序优先级
          lsp = {
              -- 如果 LSP 服务器支持 hierarchicalDocumentSymbolSupport
              hierarchical_symbols = true,
          },
          treesitter = {
              -- 确保 Treesitter 已安装并启用
              enable = true,
          },
          -- ctags provider options
          ctags = {
            program = 'ctags',
            filetypes = {
              ['c++'] = {
                -- ...
              },
            },
          },
        },
      })
    end
}
