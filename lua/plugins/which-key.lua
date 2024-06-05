return {
  "folke/which-key.nvim",
  event = "VimEnter",
  config = function()
    local which_key = require("which-key")
    which_key.setup()

    vim.g.register_which_key_path = function(keymap, name)
      which_key.register({
        [keymap] = { name = name, _ = "which_key_ignore" },
      })
    end

    vim.g.register_which_key_path("<leader>l", "+Lazy management")
  end,
}
