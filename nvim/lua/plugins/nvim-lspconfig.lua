return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp"
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local nvim_lsp = require("lspconfig")
    local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"

    local on_attach = function(_, bufnr)
      local keymap_opts = { buffer = bufnr }
      vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
      vim.keymap.set("n", "<A-K>", vim.lsp.buf.signature_help, keymap_opts)

      vim.keymap.set("n", "<leader>lc", "I//<Esc>", keymap_opts)
      vim.keymap.set("v", "<leader>c", ":s@^@//@<cr><Esc>", keymap_opts)

      -- Enable inlay hints
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end

    -- Elixir LS
    nvim_lsp.elixirls.setup({
      cmd = { mason_bin .. "/elixir-ls" },
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- Lua LS
    nvim_lsp.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          globals = { "vim" },
          workspace = {
            checkThirdParty = false,
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })

    -- Rust LS
    nvim_lsp.rust_analyzer.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          imports = {
            granularity = {
              group = "module",
            },
            prefix = "crate",
          },
          checkOnSave = {
            command = "check",
            features = "all",
          },
          cargo = {
            buildScripts = {
              enable = true,
            },
          },
          procMacro = {
            enable = true
          },
          inlayHints = {
            parameterHints = {
              enable = false
            },
            closingBraceHints = {
              enable = false
            }
          }
        }
      }
    })

    -- Json LS
    nvim_lsp.jsonls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- HTML LS
    nvim_lsp.html.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- Python LS
    nvim_lsp.pylsp.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- Ocaml LSP
    nvim_lsp.ocamllsp.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- Zig LSP
    nvim_lsp.zls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      setings = {
        zls = {
          enable_build_on_save = false,
        },
      },
    })

    -- PHP LS
    nvim_lsp.phpactor.setup {}

    nvim_lsp.gopls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.rs", "*.fs", "*.lua", "*.ml", "*.zig" },
      callback = function()
        vim.lsp.buf.format(nil, 200)
      end,
      group = format_sync_grp,
    })

    -- format on save needed for elixir, given that elixir-ls doesn't handle formatting very well...
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.ex", "*.exs" },
      callback = function()
        vim.fn.system({ "mix", "format" })
      end,
      group = format_sync_grp,
    })
  end
}
