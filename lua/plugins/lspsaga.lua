return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    -- 自定义配置选项
    ui = {
      theme = "round",
      border = "rounded",
      title = true,
      winblend = 0,
    },
    symbol_in_winbar = {
      enable = true,
    },
    diagnostic = {
      show_code_action = true,
      show_source = true,
    },
    lightbulb = {
      enable = false,
    },
    -- 其他配置...
  },
}
