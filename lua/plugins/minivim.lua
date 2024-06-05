return {
  "echasnovski/mini.nvim",
  config = function()
    -- NOTE Better Around/Inside objects
    require("mini.ai").setup({ n_lines = 500 })

    -- NOTE Add/delete/replace surround brackes/quotes/etc
    require("mini.surround").setup()

    -- NOTE Simple statusline
    local statusline = require("mini.statusline")
    statusline.setup({ use_icons = vim.g.have_nerd_font })
    statusline.section_location = function()
      return "%2l:%-2v"
    end
  end,
}
