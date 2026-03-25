return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false, -- Load Immediately
    priority = 1000, -- Ensure it loads early for correct colorscheme
    config = function()
      vim.cmd("colorscheme carbonfox") -- Set the default theme
    end,
  },
}
