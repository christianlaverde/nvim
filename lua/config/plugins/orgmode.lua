return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-orgmode/telescope-orgmode.nvim",
    "Saghen/blink.cmp",
  },
  config = function ()
    local orgmode = require("orgmode")
    orgmode.setup {
      org_agenda_files = "~/org/**/*",
      org_default_notes_file = "~/org/refile.org",
      org_blank_before_new_entry = {
        heading = false,
        plain_list_item = false,
      },
    }

    -- require("blink.cmp").setup {
    --   per_filetype = { org = { "orgmode" } },
    --   providers = {
    --     orgmode = {
    --       name = "orgmode",
    --       -- module = "orgmode.org.autocompletion.blink",
    --       fallbacks = { "buffer" },
    --     }
    --   },
    -- }

    local telescope = require("telescope");
    telescope.load_extension("orgmode")
    vim.keymap.set("n", "<leader>oh", telescope.extensions.orgmode.search_headings)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "org",
      callback = function()
        vim.keymap.set("n", "<A-Down>", '<cmd>lua require("orgmode").action("org_mappings.move_subtree_down")<CR>', {
          silent = true,
          buffer = true,
        })
        vim.keymap.set("n", "<A-Up>", '<cmd>lua require("orgmode").action("org_mappings.move_subtree_up")<CR>', {
          silent = true,
          buffer = true,
        })
        vim.keymap.set("n", "<A-Enter>", '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
          silent = true,
          buffer = true,
        })
      end,
    })

  end,
}
