return {
  event = { "BufReadPre", "BufNewFile" },
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "rust", "vim", "lua", "elixir", "heex", "eex", "yaml", "json" },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<cr>",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        }
      }
    })
  end
}
