return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            clangd = {},
            pyright = {}, -- Enable pyright
            go = {},
            -- tsserver = {}, -- Enable tsserver
        },
    },
}
