-- autocmd
------------------------------------------------------------------------------
-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.md",
  callback = function()
    local ft = vim.bo.filetype
    if ft == "markdown" then
      vim.treesitter.start(0, "markdown")
      vim.treesitter.start(0, "markdown_inline")
    end
  end,
})

-- Source - https://stackoverflow.com/a/79676790
-- Posted by SergioAraujo, modified by community. See post 'Timeline' for change history
-- Retrieved 2026-03-27, License - CC BY-SA 4.0
local autocmd = vim.api.nvim_create_autocmd

-- @returns a "clear = true" augroup
local function augroup(name) return vim.api.nvim_create_augroup('lou-lazyvim_' .. name, { clear = true }) end

autocmd('BufReadPost', {
  group = augroup('restore_position'),
  callback = function()
    local exclude = { 'gitcommit' }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then return end

    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local line_count = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
      vim.api.nvim_feedkeys('zvzz', 'n', true)
    end
  end,
  desc = 'Restore cursor position after reopening file',
})
