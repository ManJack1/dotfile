-- vim.lsp.diagnostics.virtual_text = true- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
vim.cmd([[
  hi VertSplit guifg=#0000FF ctermfg=blue
]])


lvim.plugins = {
  "lervag/vimtex",
  {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp"
},

  "mfussenegger/nvim-jdtls",
  ---python
  "ChristianChiarulli/swenv.nvim",
  "stevearc/dressing.nvim",
  "mfussenegger/nvim-dap-python",
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",
  
  'tribela/vim-transparent',


}

----setting vimtex
vim.api.nvim_command('filetype plugin indent on')
vim.api.nvim_command('syntax enable')
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.maplocalleader = "m"

----basic-set
-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'
-- jkhl 移动时光标周围保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = true
-- 高亮所在行
vim.wo.cursorline = true
---高亮所在列
vim.o.cursorcolumn = false
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 右侧参考线，超过表示代码太长了，考虑换行
vim.wo.colorcolumn = "80"
-- 缩进2个空格等于一个Tab
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
-- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
-- 新行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索不要高亮
vim.o.hlsearch = false
-- 边输入边搜索
vim.o.incsearch = true
-- 命令行高为2，提供足够的显示空间
vim.o.cmdheight = 2
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.wo.wrap = true 
-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.o.whichwrap = '<,>,[,]'
-- 允许隐藏被修改过的buffer
vim.o.hidden = true
-- 鼠标支持
vim.o.mouse = "a"
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- smaller updatetime
vim.o.updatetime = 300
-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
vim.o.timeoutlen = 500
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 样式
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = true
vim.o.listchars = "space:·"
-- 补全增强
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
-- 补全最多显示10行
vim.o.pumheight = 10
-- 永远显示 tabline
vim.o.showtabline = 2
-- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.o.showmode = false


----lsp
require("lspconfig").ltex.setup {}




    vim.g.tex_flavor='latex' -- Default tex file format
    vim.g.vimtex_view_method = 'skim'
    -- allows forward search after every successful compilation
    vim.g.vimtex_view_skim_sync = 1
    -- allows change focus to skim after command `:VimtexView` is given
    vim.g.vimtex_view_skim_activate = 1

    vim.g.vimtex_indent_bib_enabled = 0
    vim.g.vimtex_indent_enabled = 0

    vim.g.vimtex_complete_enabled = 0
    -- Disable imaps (using Ultisnips)
    vim.g.vimtex_imaps_enabled = 0
    -- Do not open pdfviwer on compile
    vim.g.vimtex_view_automatic = 0
    -- Disable conceal
    vim.g.vimtex_syntax_conceal = {
        accents = 0,
        cites = 0,
        fancy = 0,
        greek = 0,
        math_bounds = 0,
        math_delimiters = 0,
        math_fracs = 0,
        math_super_sub = 0,
        math_symbols = 0,
        sections = 0,
        styles = 0,
    }
    -- Enable quickfix auto open
    -- vim.g.vimtex_quickfix_ignore_mode = 1
    vim.g.vimtex_compiler_progname = 'nvr'
    -- PDF viewer settings
    -- vim.g.vimtex_view_general_viewer = "skim"
    -- auto open quickfix on compile erros
    vim.g.vimtex_quickfix_mode = 1
    -- Latex warnings to ignore
    vim.g.vimtex_quickfix_ignore_filters = {
        "Command terminated with space",
        "LaTeX Font Warning: Font shape",
        "Package caption Warning: The option",
        [[Underfull \\hbox (badness [0-9]*) in]],
        "Package enumitem Warning: Negative labelwidth",
        [[Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in]],
        [[Package caption Warning: Unused \\captionsetup]],
        "Package typearea Warning: Bad type area settings!",
        [[Package fancyhdr Warning: \\headheight is too small]],
        [[Underfull \\hbox (badness [0-9]*) in paragraph at lines]],
        "Package hyperref Warning: Token not allowed in a PDF string",
        [[Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in paragraph at lines]],
    }
    vim.g.vimtex_fold_enabled = 0
    vim.g.vimtex_fold_manual = 0
    vim.g.vimtex_fold_types = {
        cmd_addplot = {
            cmds = { "addplot[+3]?" },
        },
        cmd_multi = {
            cmds = {
                "%(re)?new%(command|environment)",
                "providecommand",
                "presetkeys",
                "Declare%(Multi|Auto)?CiteCommand",
                "Declare%(Index)?%(Field|List|Name)%(Format|Alias)",
            },
        },
        cmd_single = {
            cmds = { "hypersetup", "tikzset", "pgfplotstableread", "lstset" },
        },
        cmd_single_opt = {
            cmds = { "usepackage", "includepdf" },
        },
        comments = {
            enabled = 0,
        },
        env_options = vim.empty_dict(),
        envs = {
            blacklist = {},
            whitelist = { "figure", "frame", "table", "example", "answer" },
        },
        items = {
            enabled = 0,
        },
        markers = vim.empty_dict(),
        preamble = {
            enabled = 0,
        },
        sections = {
            parse_levels = 0,
            parts = { "appendix", "frontmatter", "mainmatter", "backmatter" },
            sections = {
                "%(add)?part",
                "%(chapter|addchap)",
                "%(section|section\\*)",
                "%(subsection|subsection\\*)",
                "%(subsubsection|subsubsection\\*)",
                "paragraph",
            },
        },
    }
------snip

require("luasnip").config.set_config({ -- Setting LuaSnip config

  -- Enable autotriggered snippets
  enable_autosnippets = true,

  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",
})

----formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "clang-format",
    filetypes = { "java","python","latex" },
    name = "black", 

  }
}


vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })


-----python

-- install plugins


-- automatically install python syntax highlighting
lvim.builtin.treesitter.ensure_installed = {
  "python",
}

-- setup formatting
local formatters = require "lvim.lsp.null-ls.formatters"
--formatters.setup { { name = "black" }, }
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.py" }

-- setup linting
local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "flake8", filetypes = { "python" } } }

-- setup debug adapter
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- setup testing
require("neotest").setup({
  adapters = {
    require("neotest-python")({
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
      },
      args = { "--log-level", "DEBUG", "--quiet" },
      runner = "pytest",
    })
  }
})

lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>",
  "Test Method" }
lvim.builtin.which_key.mappings["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
  "Test Method DAP" }
lvim.builtin.which_key.mappings["df"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" }
lvim.builtin.which_key.mappings["dF"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" }
lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }


-- binding for switching
lvim.builtin.which_key.mappings["C"] = {
  name = "Python",
  c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}

