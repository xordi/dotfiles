return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.3",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Find files'})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'LiveGrep find'})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers'})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags'})
    vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = 'Pick colorscheme'})

    vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, { desc = 'Find document symbols'})
    vim.keymap.set('n', '<leader>S', builtin.lsp_workspace_symbols, { desc = 'Find workspace symbols'})
    vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = 'Goto implementations'})
    vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Goto definitions'})
    vim.keymap.set('n', 'gD', builtin.lsp_type_definitions, { desc = 'Goto type definitions'})
    vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'Goto references'})
  end
}
