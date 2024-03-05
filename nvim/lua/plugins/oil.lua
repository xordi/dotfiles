return {
  'stevearc/oil.nvim',
  keys = {
    { "_", "<cmd>Oil<cr>", desc = "Open current directory in oil", silent = true },
  },
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" }
}
