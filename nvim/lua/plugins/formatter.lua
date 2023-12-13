return {
  "mhartington/formatter.nvim",
  ft = { "yaml", "sql", "graphql", "json" },
  opts = function()
    local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
    return {
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        sql = {
          function()
            return {
              exe = mason_bin .. "/sql-formatter",
              args = {
                "-l",
                "postgresql"
              },
              stdin = true,
            }
          end
        },
        yaml = {
          function()
            return {
              exe = mason_bin .. "/yamlfmt",
              args = {
                "-in",
              },
              stdin = true,
            }
          end
        },
        graphql = {
          require("formatter.filetypes.graphql").prettierd,
        },
        json = {
          require("formatter.filetypes.json").jq,
        }
      }
    }
  end,
  config = function(_, opts)
    local formatter = require("formatter")

    -- format on save when not using LSP
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*" },
      command = "FormatWrite",
      group = FormatAutoGroup,
    })

    formatter.setup(opts)
  end
}
