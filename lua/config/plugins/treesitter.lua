return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
      require("nvim-treesitter.configs").setup {
        -- Parser Names
        ensure_installed = {
          "vim", "vimdoc", "python", "c", "rust", "go", "bash",
          "javascript", "typescript", "html", "css", "json", "json5",
          "markdown", "markdown_inline", "dockerfile"
        },
        ignore_install = {},
        modules = {},
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end
  }

