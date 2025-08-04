return {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml', '.git' },
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "crate",
      },
      check = {
        command = "check",
        allTargets = true,
      },
      checkOnSave = true,
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
}
