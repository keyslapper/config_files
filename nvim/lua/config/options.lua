-- options
--------------------------------------------------------------------------------
-- Relative and absolute line numbers combined
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 100

-- Cursorline
vim.opt.cursorline = true
vim.opt.ttyfast = true

-- Show whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Preview substitutions
vim.opt.inccommand = 'split'

-- Text wrapping
vim.opt.wrap = true
vim.opt.breakindent = true

-- Tabstops
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Window splitting
vim.opt.splitright = true
vim.opt.splitbelow = false

-- Save undo history
vim.opt.undofile = true

-- Set the default border for all floating windows
vim.opt.winborder = 'rounded'

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 0

-- if performing an operation that would fail due to unsaved changes in the
-- buffer (like `:q`), instead raise a dialog asking if you wish to save the
-- current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true


-- vim.cmd([[match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$']])
-- vim.cmd([[match ErrorMsg '\s\+$']])

vim.fn.matchadd('ErrorMsg', '\\s\\+$')
vim.fn.matchadd('ErrorMsg', '^\\(<\\|=\\|>\\)\\{7\\}\\([^=].\\+\\)\\?$')

