-- ============================================================================
-- ~/.config/nvim/ftplugin/markdown.lua
-- Local buffer configurations for Markdown Tables & Previews
-- ============================================================================

local map = vim.keymap.set
local opts = { buffer = true, silent = true }

-- 1. STABLE BASE CONFIGURATION
require("markdown-table-wrap").setup({
    inline_mode = "replace",        -- Ensures accurate cell sizing
    preview_mode = "float",        -- Independent floating window
    auto_preview = false,          -- Disables auto-calculation
    table_border = "rounded",
    row_separator = true,
})

-- 2. MANUAL HOVER ACCESSIBILITY MAP (K)
map('n', 'K', function()
    local line = vim.api.nvim_get_current_line()
    if line:match("^%s*|") then
        vim.cmd("MarkdownTableFloatPreview")
        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
            local config = vim.api.nvim_win_get_config(win)
            local buf = vim.api.nvim_win_get_buf(win)
            local buf_name = vim.api.nvim_buf_get_name(buf)
            if config and config.relative ~= "" and buf_name:match("markdown%-table%-wrap") then
                map('n', '<Esc>', function()
                    vim.cmd("MarkdownTableClosePreview")
                end, { buffer = buf, silent = true, desc = "Exit Table Float Preview" })
                break
            end
        end
    else
        pcall(vim.lsp.buf.hover)
    end
end, vim.tbl_extend("force", opts, { desc = "Trigger Table Floating Hover View" }))

-- 3. WINDOW ESCAPE SAFETY
local clear_preview_group = vim.api.nvim_create_augroup("MarkdownTableFloatSanity", { clear = true })
vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave" }, {
    group = clear_preview_group,
    pattern = "*.md",
    callback = function()
        pcall(function() vim.cmd("MarkdownTableClosePreview") end)
    end,
})

