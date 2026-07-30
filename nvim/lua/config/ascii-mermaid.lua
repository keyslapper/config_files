require("ascii-mermaid").setup({
  auto = true,              -- auto-render on BufEnter and CursorHold
  use_ascii = false,        -- false = Unicode box-drawing, true = ASCII (+,-,|,>)
  debounce_ms = 500,        -- debounce delay for CursorHold re-renders
  padding_x = 2,            -- horizontal padding inside node boxes
  padding_y = 1,            -- vertical padding inside node boxes
  display_mode = "replace", -- "inline", "replace", "hybrid", or "readonly"
  hybrid_threshold = 15,    -- line count threshold for hybrid mode
})
