return {
  "echasnovski/mini.bufremove",
  branch = "stable",
  keys = {
    { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Buffer close" },
    { "<leader>bD", function() require("mini.bufremove").delete(0, true) end,  desc = "Buffer close (force)" }
  },
  config = true
}
