return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	init = function()
		-- Parser Names
		ensure_installed = { 
			"help", "vim", "vimdoc", "python", "c", "rust", "go", "bash",
			"javascript", "typescript", "html", "css", "json", "json5",
			"markdown", "markdown_inline", "dockerfile"
		}
		sync_install = false
		auto_install = true
		highlight = { 
			enable = true,
			additional_vim_regex_highlighting = false,
		}
	end
}
