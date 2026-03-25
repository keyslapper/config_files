require("nightfox").setup({
  -- Optional: Customize the theme
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/carbonfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent     = true,  -- Disable setting background
    terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive    = true,  -- Non focused panes set to alternative background
    module_default  = true,  -- Default enable value for modules
    colorblind = {
      enable = false,        -- Enable colorblind support
      simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
    },
    styles = {               -- Style to be applied to different syntax groups
      comments = "italic",   -- Value is any valid attr-list value `:help attr-list`
      conditionals = "bold",
      constants = "NONE",
      functions = "NONE",
      keywords = "bold",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
      sidebars = "transparent",
      floats = "transparent",
    },
  },
  groups = {
    all = {
      String = { fg = "#33aa00" },
      -- Comment = { fg = "#ff8000" },
      Comment = { fg = "#3333ff" },
    }
  }
})

vim.cmd("colorscheme carbonfox") -- Set the default theme

