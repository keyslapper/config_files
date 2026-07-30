require("markdown-table-wrap").setup({
  max_width_ratio = 0.9,
  min_col_width = 3,
  max_col_width = 80,
  border = "rounded",
  use_unicode_border = true,
  table_border = "rounded", -- single, double, rounded
  row_separator = true,
  preview_mode = 'inline', -- inline or float
  inline_mode = "replace", -- replace or insert
  inline_position = "above", -- above or below for insert mode
  dim_source = true,
  auto_preview = false,
  render_all = true,
  auto_preview_in_insert = false,
  clear_on_cursor_leave = true,
  clear_on_insert = true,
  clear_on_visual = true,
  debounce_ms = 80,
  overlay_priority = 10000,
  overlay_fill = false,
  -- inline_virtual_text = "overlay",
  inline_virtual_text = 'win_col',
  inline_disable_wrap = false,
  inline_viewport_scrolling = false,
  highlight_preset = "default",
  theme_dir = nil,
  themes = {},
  highlights = {},
  map_gx = true,
  link = {
    wiki = { icon = " ", highlight = "MarkdownTableWrapWikiLink", scope_highlight = "MarkdownTableWrapWikiLink" },
    image = " ",
    custom = {
      github = { pattern = "github", icon = " " },
      gitlab = { pattern = "gitlab", icon = "󰮠 " },
      youtube = { pattern = "youtube", icon = " " },
      bilibili = { pattern = "bilibili", icon = "󰟴 " },
      cern = { pattern = "cern.ch", icon = " " },
    },
  }
})
