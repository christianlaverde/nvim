return {
  "nvim-telescope/telescope.nvim", tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make"
    },
    {
      "nvim-tree/nvim-web-devicons",
      opts = {}
    },
  },
  config = function()
    require("telescope").setup {
      defaults = require("telescope.themes").get_ivy(),
      extensions = {
        fzf = {}
      }
    }

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>pf", builtin.git_files, { desc = "Telescope git files" })
    vim.keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Telescope lsp references" })
    vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "Telescope lsp definitions" })
    vim.keymap.set("n", "<leader>en", function()
      builtin.find_files { cwd = vim.fn.stdpath "config" }
    end)

    require("telescope").load_extension("fzf")
  end
}
