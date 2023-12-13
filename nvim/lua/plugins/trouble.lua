return {
  "folke/trouble.nvim",
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle<cr>",                       desc = "Toggle trouble" },
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace diagnostics" },
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = 'Document diagnostics' },
    { "<leader>xl", "<cmd>TroubleToggle loclist<cr>" },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",              desc = 'Quickfix list' },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    signs = {
      error = ""
    }
  }
}
