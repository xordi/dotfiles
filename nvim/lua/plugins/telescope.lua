return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },
  opts = {
    defaults = {
      file_ignore_patterns = { 'node_modules/', '.git/', 'target/', '.elixir_ls/', '_build/' },
    },
  },
  config = function(_p, opts)
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>f', ':lua require("telescope.builtin").find_files({hidden=true, no_ignore=true})<CR>',
      { desc = 'Find files', silent = true })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'LiveGrep find' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
    vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = 'Pick colorscheme' })

    vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, { desc = 'Find document symbols' })
    vim.keymap.set('n', '<leader>S', builtin.lsp_workspace_symbols, { desc = 'Find workspace symbols' })
    vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = 'Goto implementations' })
    vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Goto definitions' })
    vim.keymap.set('n', 'gD', builtin.lsp_type_definitions, { desc = 'Goto type definitions' })
    vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'Goto references' })

    require('telescope').setup(opts)
    require('telescope').load_extension('fzf')
  end
}
