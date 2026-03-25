-- keymap
--------------------------------------------------------------------------------
-- Navigate visual lines
-- vim.keymap.set({ 'n', 'x' }, 'j', 'gj', { desc = 'Navigate down (visual line)' })
-- vim.keymap.set({ 'n', 'x' }, 'k', 'gk', { desc = 'Navigate up (visual line)' })
vim.keymap.set({ 'n', 'x' }, '<Down>', 'gj', { desc = 'Navigate down (visual line)' })
vim.keymap.set({ 'n', 'x' }, '<Up>', 'gk', { desc = 'Navigate up (visual line)' })
vim.keymap.set('i', '<Down>', '<C-\\><C-o>gj', { desc = 'Navigate down (visual line)' })
vim.keymap.set('i', '<Up>', '<C-\\><C-o>gk', { desc = 'Navigate up (visual line)' })

-- Move Lines
vim.keymap.set({ 'n', 'x' }, '<M-S-Up>', ':move -2<cr>', { desc = 'Move Line Up' })
vim.keymap.set({ 'n', 'x' }, '<M-S-Down>', ':move +1<cr>', { desc = 'Move Line Down' })
vim.keymap.set('i', '<M-S-Up>', '<C-o>:move -2<cr>', { desc = 'Move Line Up' })
vim.keymap.set('i', '<M-S-Down>', '<C-o>:move +1<cr>', { desc = 'Move Line Down' })

-- Easier interaction with the system clipboard
vim.keymap.set({ 'n', 'x' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set({ 'n', 'x' }, '<leader>p', '"+p', { desc = 'Paste from system clipboard after the cursor position' })
vim.keymap.set({ 'n', 'x' }, '<leader>P', '"+P', { desc = 'Paste from system clipboard before the cursor position' })

-- Navigating buffers
vim.keymap.set('n', '<leader>bb', '<C-^>', { desc = 'Switch to alternate buffer' })
vim.keymap.set('n', '<leader>bn', ':bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>d', ':Ex<cr>', { silent = true, desc = 'Open Directory' })
vim.keymap.set('n', '<leader>1', 'yyPVr*', { desc = 'Create "*" header above' })
vim.keymap.set('n', '<leader>2', 'yypVr*', { desc = 'Create "*" header below' })
vim.keymap.set('n', '<leader>3', 'yyPVr=', { desc = 'Create "=" header above' })
vim.keymap.set('n', '<leader>4', 'yypVr=', { desc = 'Create "=" header below' })
vim.keymap.set('n', '<leader>5', 'yyPVr#', { desc = 'Create "#" header above' })
vim.keymap.set('n', '<leader>6', 'yypVr#', { desc = 'Create "#" header below' })
vim.keymap.set('n', '<leader>7', 'yyPVr"', { desc = 'Create "\"" header above' })
vim.keymap.set('n', '<leader>8', 'yypVr"', { desc = 'Create "\"" header below' })


vim.keymap.set('n', '<leader>o', ':w<CR> :so $MYVIMRC<CR>', { noremap = true, silent = true, desc = 'Save buffer and source $MYVIMRC' })
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Write current buffer' })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>n', ':setlocal number! relativenumber!<CR>', { desc = 'Toggle line numbers' })
vim.keymap.set('n', '<leader><cr>', ':!update_tags >/dev/null 2>&1 &<CR>:redraw<cr>', { noremap = true, silent = true, desc = 'Update C Tags' })
vim.keymap.set('n', '<esc><esc>', ':noh<cr>', { noremap = true, silent = true, desc = 'Turn off search highlighting until next search' })
vim.keymap.set({'n', 'v'}, '<tab>', '%', { noremap = true, desc = 'Jump brackets' })
vim.keymap.set('n', '<c-u>', 'viwUe', { noremap = true, desc = 'Uppercase word under cursor' })
vim.keymap.set('i', '<c-u>', '<esc>viwUea', { noremap = true, desc = 'Uppercase word under cursor' })

vim.keymap.set('n', 'U', ':syntax sync fromstart<cr>:redraw!<cr>', { noremap = true, desc = 'Clean up glitched syntax highlighting' })

vim.keymap.set('n', '<Leader>W', [[:%s/\s\+$//e<cr>]], { desc = "Remove trailing whitespace" })
vim.keymap.set('n', '<Leader>t', ':vsplit term://bash<cr>', { noremap = true, desc = "Open terminal buffer in split mode" })
vim.keymap.set('n', '<Leader>b', ':! ~/bin/build <cr>', { noremap = true, desc = "Build the current workspace" })

vim.keymap.set('n', '<leader>v', ':vsplit<CR>', { desc = 'Split window vertically' })
vim.keymap.set('n', '<F10>', ':vsplit<CR>', { desc = 'Split window vertically' })
--vim.keymap.set('n', '<C-F10>', ':split<CR>', { desc = 'Split window horizontally' })

-- Toggle mouse capture
vim.keymap.set('n', '<F11>', function()
    if vim.o.mouse == 'a' then
        vim.o.mouse = ''
        print('Mouse disabled')
    else
        vim.o.mouse = 'a'
        print('Mouse enabled')
    end
end, { desc = 'Toggle mouse capture' })

vim.keymap.set("n", "]c", function() require("gitsigns").nav_hunk("next") end, { desc = "Next Hunk" })
vim.keymap.set("n", "[c", function() require("gitsigns").nav_hunk("prev") end, { desc = "Previous Hunk" })

vim.keymap.set('n', '`', '\'', { desc = 'Map ";" to ":"' })
vim.keymap.set('n', '\'', '`', { desc = 'Map ";" to ":"' })
vim.keymap.set('n', ';', ':', { desc = 'Map ";" to ":"' })
vim.keymap.set('n', 'Y', 'yy', { desc = 'Yank current line' })
vim.keymap.set('n', 'Q', 'gwap', { desc = 'Format current paragraph' })
vim.keymap.set('v', 'Q', 'gw', { desc = 'Format selected section' })
vim.keymap.set('n', 'F', 'zf%', { desc = 'Fold on bracket' })
vim.keymap.set('n', 'f', 'zd', { desc = 'Remove fold' })


vim.keymap.set('n', '<leader>j', [[/\v^[<\|=>]{7}([^=].+)?$<CR>]], { desc = 'Find conflict markers' })

-- Convenience mappings ================================= {{{
-- Window Navigation with Ctrl-[hjkl]
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to lower buffer' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to lower buffer' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to upper buffer' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left buffer'  })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right buffer' })

-- Toggle visible whitespace characters
--vim.keymap.set('n', '<leader>l', ':listchars!<cr>', { desc = 'Toggle [l]istchars' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Quickly source current file / execute Lua code
vim.keymap.set('n', '<leader>xx', '<Cmd>source %<CR>', { desc = 'Source current file' })
vim.keymap.set('n', '<leader>x', '<Cmd>:.lua<CR>',     { desc = 'Lua: execute current line' })
vim.keymap.set('v', '<leader>x', '<Cmd>:lua<CR>',      { desc = 'Lua: execute current selection' })


-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep,  { desc = 'Telescope live grep'  })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers,    { desc = 'Telescope buffers'    })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags,  { desc = 'Telescope help tags'  })

