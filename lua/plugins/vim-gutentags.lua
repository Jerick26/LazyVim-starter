return {
    "ludovicchabant/vim-gutentags",
    lazy = false,
    -- https://github.com/kuator/nvim/blob/master/lua/plugins/vim-gutentags.lua
    config = function()
        -- https://www.reddit.com/r/vim/comments/d77t6j/guide_how_to_setup_ctags_with_gutentags_properly/
        vim.g.gutentags_ctags_exclude = {
            "*.git",
            "*.svg",
            "*.hg",
            "*/tests/*",
            "build",
            "dist",
            "*sites/*/files/*",
            "bin",
            "node_modules",
            "bower_components",
            "cache",
            "compiled",
            "docs",
            "example",
            "bundle",
            "vendor",
            "*.log",
            "*.md",
            "*-lock.json",
            "*.lock",
            "*bundle*.js",
            "*build*.js",
            ".*rc*",
            "*.json",
            "*.min.*",
            "*.map",
            "*.bak",
            "*.zip",
            "*.pyc",
            "*.class",
            "*.sln",
            "*.Master",
            "*.csproj",
            "*.tmp",
            "*.csproj.user",
            "*.cache",
            "*.pdb",
            "tags*",
            "cscope.*",
            "*.css",
            "*.less",
            "*.scss",
            "*.exe",
            "*.dll",
            "*.mp3",
            "*.ogg",
            "*.flac",
            "*.swp",
            "*.swo",
            "*.bmp",
            "*.gif",
            "*.ico",
            "*.jpg",
            "*.png",
            "*.rar",
            "*.zip",
            "*.tar",
            "*.tar.gz",
            "*.tar.xz",
            "*.tar.bz2",
            "*.pdf",
            "*.doc",
            "*.docx",
            "*.ppt",
            "*.pptx",
        }
        vim.g.gutentags_ctags_tagfile = ".tags"
        vim.g.gutentags_ctags_executable = "ctags"
        vim.g.gutentags_add_default_project_roots = false
        vim.g.gutentags_project_root = { ".git", ".root", "tags" }
        vim.g.gutentags_cache_dir = vim.fn.stdpath("cache") .. "/tags"
        vim.g.gutentags_generate_on_new = 1
        vim.g.gutentags_generate_on_missing = 1
        vim.g.gutentags_generate_on_write = 1
        vim.g.gutentags_generate_on_empty_buffer = 1
        vim.cmd([[command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')]])
        vim.g.gutentags_ctags_args = {
            "-R",
            "--extra=+q", -- Include qualified names
            "--fields=+l", -- Include language information
        }
        vim.g.gutentags_ctags_extra_args = { "--tag-relative=yes", "--fields=+ailmnS" }
    end,
}
