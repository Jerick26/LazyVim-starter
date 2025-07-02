return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "craftzdog/solarized-osaka.nvim" },
        opts = {
            options = {
                theme = "solarized-osaka", -- 专为 Solarized 设计的主题
                section_separators = { left = "", right = "" },
                globalstatus = true,
            },
            sections = {
                lualine_c = {
                    {
                        "filename",
                        path = 1,
                        color = { bg = "#002b36" }, -- 匹配背景色
                    },
                },
            },
        },
    },

    -- 搜索 (保留 Telescope 但优化键位)
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "查找文件" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "内容搜索" },
            { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "CtrlP 风格搜索" }, -- 添加 CtrlP 习惯键
        },
    },
}
