-- 加载核心配置
require("config.options")
require("config.keymaps")

-- 混合功能加载
require("config.lazy") -- LazyVim 插件管理器

require("outline").setup({})
