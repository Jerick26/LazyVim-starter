return {
    {
       "mason-org/mason.nvim",
        -- opts = function(_, opts)
        --     table.insert(opts.ensure_installed, "black")
        -- end,
        config = function()
          require("mason").setup()
        end,
    },
    -- Mason-LSPConfig to integrate Mason with nvim-lspconfig
    {
      "mason-org/mason-lspconfig.nvim",
      dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
      },
      opts = {
        ensure_installed = {
          "clangd", -- Add clangd to the list of servers to install
          "black",
          "pyright",
          "lua_ls",
        },
      },
      config = function()
        require("mason-lspconfig").setup({
          setup_handlers = {
            -- Example for clangd, if you need specific settings
            ["clangd"] = function()
              require("lspconfig").clangd.setup({
                -- Your clangd-specific settings here
              })
            end,
            -- Default handler for other servers managed by Mason
            function(server_name)
              require("lspconfig")[server_name].setup({})
            end,
          },
        })
      end,
    },
    -- nvim-lspconfig for general LSP client setup
    {
      "neovim/nvim-lspconfig",
      config = function()
        -- Ensure clangd is enabled if you're not using mason-lspconfig's setup_handlers
        -- require("lspconfig").clangd.setup({})
      end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function(_, opts)
            local nls = require("null-ls")
            table.insert(opts.sources, nls.builtins.formatting.black)
        end,
    },
}
