return {
    "fatih/vim-go",
    ft = "go", -- 只在编辑 Go 文件时加载
    build = ":GoInstallBinaries", -- 安装插件所需的二进制文件
    config = function()
        -- Vim-go 配置选项
        vim.g.go_gopls_enabled = 1
        vim.g.go_fmt_autosave = 1
        vim.g.go_imports_autosave = 1
        vim.g.go_mod_fmt_autosave = 1
        vim.g.go_doc_keywordprg_enabled = 1

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "go",
            callback = function()
                local opts = { noremap = true, silent = true }
                vim.keymap.set("n", "<leader>gd", "<Plug>(go-definition)", opts)
                vim.keymap.set("n", "<leader>gr", "<Plug>(go-rename)", opts)
                vim.keymap.set("n", "<leader>gi", "<Plug>(go-implements)", opts)
                vim.keymap.set("n", "<leader>gt", "<Plug>(go-test)", opts)
                vim.keymap.set("n", "<leader>gb", "<Plug>(go-build)", opts)
                vim.keymap.set("n", "<leader>gr", "<Plug>(go-run)", opts)
            end,
        })
    end,
}
