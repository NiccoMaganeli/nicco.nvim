return {
  "folke/which-key.nvim",
  event = "VimEnter",
  config = function()
    local which_key = require("which-key")
    which_key.setup()

    -- Document a few prefixes
    which_key.register({
      ["<leader>l"] = { name = "+Lazy management", _ = "which_key_ignore" }
    })
  end
}
