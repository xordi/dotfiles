return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Toggle trouble" },
    { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = 'Document diagnostics' },
    { "<leader>xl", "<cmd>Trouble loclist toggle<cr>" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<cr>",                   desc = 'Quickfix list' },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    signs = {
      error = ""
    }
  }
}
