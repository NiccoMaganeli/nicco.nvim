return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "folke/which-key.nvim", -- IMPORTANT just used to load which-key first
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    "nvim-telescope/telescope-ui-select.nvim",
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "ui-select")

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search help" })
    vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search keymaps" })
    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search files" })
    vim.keymap.set("n", "<leader>st", builtin.builtin, { desc = "Search select telescope" })
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search current word" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search by grep" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search diagnostics" })
    vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Resume last picker" })
    vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "Search recent files" })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Search existing buffers" })

    vim.keymap.set("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = "Fuzzily search in current buffer" })

    vim.keymap.set("n", "<leader>sn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "Search Neovim configuration files" })
  end,
}
