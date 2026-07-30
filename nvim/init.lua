require('config.globals')
require('config.options')
require('config.lazy')
require('config.nightfox')
require('config.gitsigns')
require('config.nvim-web-devicons')
require('config.treesitter')
require('config.keymap')
require('config.autocmd')
require('config.lsp')
require('config.ascii-mermaid')
require('config.markdown-table-wrap')
require('config.render-markdown')

-- vim.api.nvim_create_augroup("LargeFile", { clear = true })
-- vim.api.nvim_create_autocmd("BufReadPre", {
--   group = "LargeFile",
--   pattern = "*",
--   callback = function()
--     local fsize = vim.fn.getfsize(vim.fn.expand("%:p"))
--     -- 2 MB limit (size is in bytes)
--     if fsize > 2 * 1024 * 1024 then
--       vim.schedule(function()
--         -- Disable features causing the lock up
--         vim.cmd("syntax off")
--         vim.cmd("setlocal eventignore+=FileType")
--         vim.cmd("setlocal bufhidden=unload")
--         vim.cmd("setlocal undolevels=-1")
--         vim.cmd("setlocal noswapfile")
--         print("Large file detected: Heavy features disabled for performance.")
--       end)
--     end
--   end
-- })

