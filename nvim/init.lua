-- visual settings
vim.cmd.colorscheme('default')
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.winborder = 'rounded'

-- editor
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.g.mapleader = ' '

-- grep
vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
vim.opt.grepformat = '%f:%l:%c:%m'

-- indentation
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.wrap = false

-- file handling
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.autowriteall = true

-- editor mappings
vim.keymap.set('n', '<C-s>', ':w<CR>', { silent = true })
vim.keymap.set('i', 'jj', '<ESC>', { silent = true })
vim.keymap.set('i', 'AA', '<ESC>A', { silent = true })
vim.keymap.set('i', 'II', '<ESC>I', { silent = true })
vim.keymap.set('n', '<Esc>', ':nohl<CR>', { silent = true })
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { silent = true})
vim.keymap.set('n', 'j', 'jzz', { silent = true})
vim.keymap.set('n', 'k', 'kzz', { silent = true})

-- window navigation
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })

-- clipboard
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>p', '"+p')

-- lsp setup
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp', {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)

    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
      vim.api.nvim_create_autocmd('InsertCharPre', {
        group = vim.api.nvim_create_augroup('lsp', { clear = false }),
        callback = function(_)
          vim.lsp.completion.get()
        end
      })
    end

    if client:supports_method('textDocument/inlayHint') then
      vim.lsp.inlay_hint.enable(true)
    end

    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end
      })
    end
  end
})

vim.lsp.enable({'luals', 'rust_analyzer'})

-- some kind of essential plugins
vim.pack.add({'https://github.com/stevearc/oil.nvim'})
vim.pack.add({'https://github.com/nvim-treesitter/nvim-treesitter'})
vim.pack.add({'https://github.com/ibhagwan/fzf-lua'})
vim.pack.add({'https://github.com/christoomey/vim-tmux-navigator'})

-- oil setup & config
require('oil').setup()

vim.keymap.set('n', '_', '<CMD>Oil<CR>', {silent = true, desc = 'Open parent directory'})

-- nvim treesitter config
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'rust', 'lua' },
  auto_install = true,
})

-- fzf-lua setup
require('fzf-lua').setup()
vim.keymap.set('n', '<leader>ff', '<CMD>FzfLua files<CR>', { silent = true })
vim.keymap.set('n', '<leader>fb', '<CMD>FzfLua buffers<CR>', { silent = true })
vim.keymap.set('n', '<leader>fs', '<CMD>FzfLua lsp_document_symbols<CR>', { silent = true })
vim.keymap.set('n', '<leader>fS', '<CMD>FzfLua lsp_workspace_symbols<CR>', { silent = true })
