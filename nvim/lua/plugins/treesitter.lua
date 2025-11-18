return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
			"go",
			"javascript",
			"typescript",
			"clojure",
			"latex",
		},
		auto_install = true,
		highlight = {
			enable = true,
		},
		indent = { enable = true },
	},
}
