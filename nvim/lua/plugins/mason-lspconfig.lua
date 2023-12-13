return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim"
  },
  lazy = true,
  opts = {
    ensure_installed = { "lua_ls", "rust_analyzer" },
    automatic_installation = true,
  }
}
