---@type LazySpec
return {
  {
    "R-nvim/R.nvim",
    lazy = false,

    config = function ()
      ---@type RConfigUserOpts
      local opts = {
        R_args = { "--quiet", "--no-save", "--no-restore" },
        R_prompt_str = "\u{f101}",
        esc_term = false,
        hook = {
          on_filetype = function ()
            vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
            vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
          end
        },
        nvimpager = "tab",
        rconsole_width = 90,
        min_editor_width = 40,
      }

      require("r").setup(opts)
    end,
  },

  {
    "Saghen/blink.cmp",
    optional = true,
    dependencies = {
      "R-nvim/cmp-r",
    },
    specs = { "Saghen/blink.compat", version = "*", lazy = true, opts = {} },
    opts = {
      sources = {
        default = { "cmp_r" },
        providers = {
          cmp_r = {
            name = "cmp_r",
            module = "blink.compat.source",
            score_offset = -1,
          }
        },
      },
    },
  },
}
