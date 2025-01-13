return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = true,
  opts = {
    options = {
      globalstatus = true,
      theme = "ayu_mirage",
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
