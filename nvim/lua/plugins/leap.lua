return {
  "ggandor/leap.nvim",
  dependencies = {
    "tpope/vim-repeat"
  },
  keys = {
    {"s", desc = "Leap forward"},
    {"S", desc = "Leap backwards"},
  },
  config =  function ()
    require("leap").add_default_mappings()
  end
}
