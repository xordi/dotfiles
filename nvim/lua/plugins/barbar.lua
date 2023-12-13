return {
  "romgrk/barbar.nvim",
  keys = {
    { "<leader>bl", "<cmd>BufferCloseBuffersLeft<CR>",           desc = 'Close buffers left' },
    { "<leader>br", "<cmd>BufferCloseBuffersRight<CR>",          desc = 'Close buffers right' },
    { "<leader>ba", "<cmd>BufferCloseAllButCurrentOrPinned<CR>", desc = 'Close all but current or pinned' },
    { "<leader>bb", "<cmd>BufferPick<CR>",                       desc = 'Buffer pick' },
  },
  dependencies = { "nvim-web-devicons" },
}
