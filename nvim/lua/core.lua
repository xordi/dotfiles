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

-- centering cursor in screen when moving fast vertically
vim.keymap.set('n', '{', '{zz', { noremap = true })
vim.keymap.set('n', '}', '}zz', { noremap = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('n', '<C-o>', '<C-o>zz', { noremap = true })
vim.keymap.set('n', '<C-i>', '<C-i>zz', { noremap = true })
vim.keymap.set('n', 'n', 'nzz', { noremap = true })
vim.keymap.set('n', 'N', 'Nzz', { noremap = true })

-- surroundings
vim.keymap.set('n', '<A-w>"', 'ciw""<Esc>P',
  { noremap = true, silent = true, desc = "Sorrund word under cursor with double quotes" })
vim.keymap.set('n', '<A-w>(', 'ciw()<Esc>P',
  { noremap = true, silent = true, desc = "Surrond word under cursor with parenthesis" })
vim.keymap.set('n', '<A-w>[', 'ciw[]<Esc>P',
  { noremap = true, silent = true, desc = "Surround word under cursor with square brackets" })
vim.keymap.set('n', '<A-w>{', 'ciw{}<Esc>P',
  { noremap = true, silent = true, desc = "Surround word under cursor with brackets" })
vim.keymap.set('n', "<A-w>'", "ciw''<Esc>P",
  { noremap = true, silent = true, desc = "Surround word under cursor with single quotes" })
vim.keymap.set('n', '<A-w><', 'ciw<><Esc>P',
  { noremap = true, silent = true, desc = "Surround word under cursor between less-greater" })


vim.keymap.set('v', '<A-w>"', 'c""<Esc>P',
  { noremap = true, silent = true, desc = "Sorrund word under cursor with double quotes" })
vim.keymap.set('v', '<A-w>(', 'c()<Esc>P',
  { noremap = true, silent = true, desc = "Surrond word under cursor with parenthesis" })
vim.keymap.set('v', '<A-w>[', 'c[]<Esc>P',
  { noremap = true, silent = true, desc = "Surround word under cursor with square brackets" })
vim.keymap.set('v', '<A-w>{', 'c{}<Esc>P',
  { noremap = true, silent = true, desc = "Surround word under cursor with brackets" })
vim.keymap.set('v', "<A-w>'", "c''<Esc>P",
  { noremap = true, silent = true, desc = "Surround word under cursor with single quotes" })
vim.keymap.set('v', '<A-w><', 'c<><Esc>P',
  { noremap = true, silent = true, desc = "Surround word under cursor between less-greater" })

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
