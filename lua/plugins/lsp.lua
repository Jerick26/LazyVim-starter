return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
        "hrsh7th/nvim-cmp", -- 自动补全集成
    },
    config = function()
        local mason_lspconfig = require("mason-lspconfig")

        -- 自动安装的语言服务器列表
        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls", -- Lua
                "pyright", -- Python
                "clangd", -- C/C++
                "rust_analyzer", -- Rust
                "bashls", -- Bash
                "jsonls", -- JSON
                "yamlls", -- YAML
                "gopls",
            },
        })

        -- diaable c++ formatting
        require("lspconfig").clangd.setup({
            on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = false
            end,
        })

        -- 配置 LSP 符号高亮
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_create_autocmd("CursorHold", {
            group = "lsp_document_highlight",
            callback = function()
                vim.lsp.buf.document_highlight()
            end,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            group = "lsp_document_highlight",
            callback = function()
                vim.lsp.buf.clear_references()
            end,
        })

        -- =============================================
        -- LSP 性能监控命令（核心位置）
        -- =============================================
        vim.api.nvim_create_user_command("LSPPerf", function()
            local messages = vim.lsp.util.get_progress_messages()
            if #messages == 0 then
                print("No active LSP operations")
                return
            end

            print("Active LSP operations:")
            for _, msg in ipairs(messages) do
                local title = msg.title or ""
                local message = msg.message or ""
                local percentage = msg.percentage or 0

                print(
                    string.format(
                        "[%s] %s: %d%%",
                        msg.token,
                        title .. (message ~= "" and ": " .. message or ""),
                        percentage
                    )
                )
            end
        end, {})

        -- =============================================
        -- 增强：自动记录慢速 LSP 操作
        -- =============================================
        vim.api.nvim_create_autocmd("User", {
            pattern = "LspProgressUpdate",
            callback = function(args)
                local msg = args.data
                if msg.percentage and msg.percentage > 0 and msg.percentage < 100 then
                    -- 记录耗时超过 5 秒的操作
                    vim.defer_fn(function()
                        local current_msgs = vim.lsp.util.get_progress_messages()
                        for _, m in ipairs(current_msgs) do
                            if m.token == msg.token and m.percentage == msg.percentage then
                                vim.notify(
                                    string.format(
                                        "Slow LSP operation: %s (stuck at %d%%)",
                                        msg.title or "",
                                        msg.percentage
                                    ),
                                    vim.log.levels.WARN
                                )
                            end
                        end
                    end, 5000) -- 5 秒后检查
                end
            end,
        })
    end,
}
