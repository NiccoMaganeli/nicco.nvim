return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "kevinhwang91/nvim-ufo",
  },
  opts = {},
  keys = {
    {
      "<leader>a",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Add current buffer to Harpoon list",
    },
    {
      "<C-e>",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Open Harpoon quick menu",
    },
    {
      "<C-h>",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Jump to first Harpoon file",
    },
    {
      "<C-j>",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Jump to second Harpoon file",
    },
    {
      "<C-k>",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Jump to third Harpoon file",
    },
    {
      "<C-l>",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "Jump to fourth Harpoon file",
    },

    -- Toggle previous & next buffers stored within Harpoon list
    {
      "<C-S-P>",
      function()
        require("harpoon"):list():prev()
      end,
      desc = "Toggle previous buffer in Harpoon list",
    },
    {
      "<C-S-N>",
      function()
        require("harpoon"):list():next()
      end,
      desc = "Toggle next buffer in Harpoon list",
    },
  },
  init = function()
    require("harpoon"):extend(require("harpoon.extensions").builtins.command_on_nav("UfoEnableFold"))
  end,
}
