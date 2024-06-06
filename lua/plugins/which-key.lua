return {
  "folke/which-key.nvim",
  event = "VimEnter",
  config = function()
    local which_key = require("which-key")
    which_key.setup()

    which_key.register({
      ["<leader>l"] = { name = "+Lazy", _ = "which_key_ignore" },
      ["<leader>s"] = { name = "+Telescope", _ = "which_key_ignore" },
    })
  end,
}
