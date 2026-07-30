return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
      -- Completely disable the built-in table layout manager
      pipe_table = {
        enabled = false,
        preset = "none",
        style = "none",
      },
      -- Prevent table structures from triggering internal highlight features
      table = {
        enabled = false,
      },
    },
  options = {},
}
