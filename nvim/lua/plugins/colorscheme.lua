return {
  "mcchrish/zenbones.nvim",
  priority = 1000,
  enabled = false,
  config = function()
    vim.g.bones_compat = true
    vim.cmd.colorscheme("neobones")
  end
}
