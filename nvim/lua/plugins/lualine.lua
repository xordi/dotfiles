return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = true,
  opts = {
    options = {
      globalstatus = true
    },
    sections = {
      lualine_c = {
        {
          "filename",
          path = 1,
        }
      },
    },
  }
}
