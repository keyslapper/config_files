require("nvim-treesitter").setup()

-- Install parsers manually or via autocmd
require("nvim-treesitter").install({
  "markdown",
  "markdown_inline",
  "lua",
  "javascript",
  -- add other languages
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

