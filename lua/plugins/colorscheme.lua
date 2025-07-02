return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false, -- 确保主题在启动时加载
    priority = 1000, -- 确保主题优先级最高
    config = function()
      vim.cmd.colorscheme("solarized-osaka")

      -- 可选：自定义主题设置
      vim.g.solarized_osaka_italic_comments = true
      vim.g.solarized_osaka_italic_keywords = true
      vim.g.solarized_osaka_italic_functions = false
      vim.g.solarized_osaka_italic_variables = false
      vim.g.solarized_osaka_transparent = false -- 启用透明背景
    end,
  },
}
