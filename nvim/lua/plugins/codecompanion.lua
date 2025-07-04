return {
  "olimorris/codecompanion.nvim",
  opts = {
    strategies = {
      chat = {
        adapter = "copilot",
        model = "gpt-4.1",
      },
      inline = {
        adapter = "copilot",
        model = "claude-3-7-sonnet-20250219"
      },
      cmd = {
        adapter = "copilot",
        model = "claude-3-7-sonnet-20250219"
      },
    },
    display = {
      diff = {
        provider = "mini_diff"
      }
    }
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = true,
  cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions", "CodeCompanionCmd" },
}
