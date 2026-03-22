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
