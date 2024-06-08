return {
  "echasnovski/mini.nvim",
  config = function()
    -- NOTE: Better Around/Inside objects
    require("mini.ai").setup({ n_lines = 500 })

    -- NOTE: Add/delete/replace surround brackes/quotes/etc
    require("mini.surround").setup()
  end,
}
