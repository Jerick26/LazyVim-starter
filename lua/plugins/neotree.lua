return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    cmd = "Neotree",
    keys = {
        { "<leader>E", "<cmd>Neotree focus<cr>", desc = "Focus Explorer" },
        { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
    },
    opts = {
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        default_component_configs = {
            indent = {
                with_markers = true,
                indent_marker = "│",
                last_indent_marker = "└",
                highlight = "NeoTreeIndentMarker",
            },
            icon = {
                folder_closed = "",
                folder_open = "",
                folder_empty = "",
                default = "",
            },
            git_status = {
                symbols = {
                    added = "✚",
                    modified = "",
                    deleted = "✖",
                    untracked = "",
                    ignored = "",
                    unstaged = "",
                    staged = "",
                    conflict = "",
                },
            },
        },
        window = {
            -- Open files in the last used window
            open_files = "last_used",
            mappings = {
                ["<space>"] = "toggle_node",
                ["<cr>"] = "open",
                ["s"] = "open_split",
                ["vs"] = "open_vsplit",
                ["t"] = "open_tabnew",
                ["h"] = "close_node",
                ["z"] = "close_all_nodes",
                ["Z"] = "expand_all_nodes",
                ["a"] = "add",
                ["d"] = "delete",
                ["rn"] = "rename",
                ["y"] = "copy_to_clipboard",
                ["x"] = "cut_to_clipboard",
                ["p"] = "paste_from_clipboard",
                ["u"] = "navigate_up", -- 跳转到上级目录
                ["."] = "set_root", -- 设置当前目录为根
                ["sh"] = "toggle_hidden",
                ["f"] = "fuzzy_finder",
                ["q"] = "close_window",
                ["r"] = "refresh",
            },
        },
        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_hidden = false,
                never_show = {},
                hide_by_name = {
                    -- "node_modules",
                    -- ".git",
                },
            },
            follow_current_file = { enabled = true },
            use_libuv_file_watcher = true,
            commands = {
                search_in_expanded = function(state)
                    local filter = function(item)
                        -- 仅匹配当前展开目录下的文件
                        for _, node in ipairs(state.tree:get_expanded_nodes()) do
                            if item.path:find("^" .. node.path, 1, true) then
                                return true -- 文件在展开目录内
                            end
                        end
                        return false
                    end
                    state.filtered_items.visible = true -- 显示所有文件
                    state.filtered_items.custom_filter = filter
                    require("neo-tree.sources.filesystem").refresh(state)
                end,
            },
        },
        buffers = {
            window = {
                mappings = {
                    ["bd"] = "buffer_delete",
                },
            },
        },
    },
}
