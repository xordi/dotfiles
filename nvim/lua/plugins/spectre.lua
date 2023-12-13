return {
  "windwp/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>t",  "<cmd>lua require('spectre').open()<CR>",                         desc = "Open Spectre" },
    { "<leader>tw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>" },
    { "<leader>t",  "<esc>:lua require('spectre').open_visual()<CR>" },
    { "<leader>ts", "viw:lua require('spectre').open_file_search()<CR>" },
  },
  config = true,
}
