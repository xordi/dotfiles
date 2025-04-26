vim.opt.termguicolors = true
vim.opt.shortmess = vim.opt.shortmess + 'c'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autowrite = true
vim.opt.autowriteall = true
vim.opt.updatetime = 100

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
vim.opt.grepformat = '%f:%l:%c:%m'

-- mappings
vim.g.mapleader = ' '
vim.keymap.set('n', '<Esc>', ':noh<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-s>', ':w<cr>', { desc = 'Save buffer' })
vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Copy to clipboard' })
vim.keymap.set('n', '<leader>p', '"+p', { desc = 'Paste from clipboard' })
vim.keymap.set('n', '<A-p>', '"0p', { desc = 'Paste last yank' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Copy to clipboard' })
vim.keymap.set('v', '<leader>p', '"+p', { desc = 'Paste from clipboard' })
vim.keymap.set('v', '<A-p>', '"0p', { desc = 'Paste last yank' })
vim.keymap.set('n', 'Y', '^yg_', { desc = 'Yank line (no newline)' })
vim.keymap.set('n', '<leader>Y', '^"+yg_', { desc = 'Yank line to clipboard (no newline)' })
vim.keymap.set('i', '<C-s>', '<Esc>:w<cr>', { desc = 'Save buffer' })
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('i', 'AA', '<Esc>A')
vim.keymap.set('i', 'II', '<Esc>I')
vim.keymap.set('n', '<leader>r', ':luafile ~/.config/nvim/init.lua<cr>', { desc = 'Reload config' })
vim.keymap.set('n', '<leader>gc', ':GitConflictListQf<cr>', { desc = 'Quick find git conflicts' })
vim.keymap.set('n', '<F4>', ':%s///g<Left><Left>', { desc = 'Search & Replace' })
vim.keymap.set('v', '<F4>', ':s///g<Left><Left>', { desc = 'Search & Replace' })
vim.keymap.set('n', '<leader>ba', ':%bd<CR>', { desc = 'Close all buffers', silent = true })

-- centering cursor in screen when moving vertically
vim.keymap.set('n', 'j', 'jzz', { noremap = true })
vim.keymap.set('n', 'k', 'kzz', { noremap = true })

-- centering cursor in screen when moving fast vertically
vim.keymap.set('n', '{', '{zz', { noremap = true })
vim.keymap.set('n', '}', '}zz', { noremap = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('n', '<C-o>', '<C-o>zz', { noremap = true })
vim.keymap.set('n', '<C-i>', '<C-i>zz', { noremap = true })
vim.keymap.set('n', 'n', 'nzz', { noremap = true })
vim.keymap.set('n', 'N', 'Nzz', { noremap = true })

-- terminal
vim.keymap.set('n', '<leader>tt', ':term<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tv', ':vnew term://zsh<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ts', ':new term://zsh<CR>', { noremap = true, silent = true })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- panes
vim.keymap.set('n', '<leader>k', ':resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>j', ':resize +2<CR>', { noremap = true, silent = true })

-- Helper function for resizing panes
local function resize_pane(direction)
  if vim.fn.winnr("$") == 1 then
    return
  end

  if direction == "left" then
    if vim.fn.winnr() == vim.fn.winnr('$') then
      vim.cmd('vertical resize +5')
    else
      vim.cmd('vertical resize -5')
    end
  elseif direction == "right" then
    if vim.fn.winnr() == 1 then
      vim.cmd('vertical resize +5') -- Resize to the right in the leftmost window
    else
      vim.cmd('vertical resize -5') -- Resize to the left in the rightmost window
    end
  end
end

vim.keymap.set('n', '<leader>h', function() resize_pane("left") end,
  { noremap = true, silent = true, desc = 'Resize or move left' })
vim.keymap.set('n', '<leader>l', function() resize_pane("right") end,
  { noremap = true, silent = true, desc = 'Resize or move right' })

vim.api.nvim_create_autocmd({ "CursorHold", "BufEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd("checktime")
  end,
  group = vim.api.nvim_create_augroup("ReloadOnChange", { clear = true }),
})

-- Filetypes that Neovim does not detect
vim.filetype.add({
  extension = {
    avsc = "json"
  }
})
