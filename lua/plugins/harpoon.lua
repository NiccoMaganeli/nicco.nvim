return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon.setup()

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "Add current buffer to Harpoon list" })
    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Open Harpoon quick menu" })
    vim.keymap.set("n", "<C-h>", function()
      harpoon:list():select(1)
    end, { desc = "Jump to first Harpoon file" })
    vim.keymap.set("n", "<C-j>", function()
      harpoon:list():select(2)
    end, { desc = "Jump to second Harpoon file" })
    vim.keymap.set("n", "<C-k>", function()
      harpoon:list():select(3)
    end, { desc = "Jump to third Harpoon file" })
    vim.keymap.set("n", "<C-l>", function()
      harpoon:list():select(4)
    end, { desc = "Jump to fourth Harpoon file" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-P>", function()
      harpoon:list():prev()
    end, { desc = "Toggle previous buffer in Harpoon list" })
    vim.keymap.set("n", "<C-S-N>", function()
      harpoon:list():next()
    end, { desc = "Toggle next buffer in Harpoon list" })
  end,
}
