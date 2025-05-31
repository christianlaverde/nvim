return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'default',
      ['<C-j>'] = { 'select_and_accept' },
    },
    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = {
      documentation = { auto_show = false }
    },
    sources = {
      default = { "lsp", "path", "snippets", },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    signature = {
      enabled = true,
      window = {
        winblend = 75,
        border = "rounded",
      }
    },
  },
  opts_extend = { "sources.default" },
}
