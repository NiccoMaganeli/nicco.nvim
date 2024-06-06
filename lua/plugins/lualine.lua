return {
  "nvim-lualine/lualine.nvim",
  requires = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local palette = require("neofusion.palette")

    require("lualine").setup({
      theme = require("neofusion.lualine"),
      inactive_sections = {},
      sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = { "location", "filename" },
        lualine_x = { "diagnostics" },
        lualine_y = { "branch", "diff" },
        lualine_z = {
          {
            "filesize",
            cond = function()
              return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
            end,
          },
          { "o:encoding", fmt = string.upper },
          { "fileformat", icons_enabled = false },
        },
      },
    })
  end,
}
