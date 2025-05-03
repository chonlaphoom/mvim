-- install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
		opts = {},
	},
	require("plugins.cmp"),
	require("plugins.conform"),
	require("plugins.gitsigns"),
	require("plugins.lsp"),
	require("plugins.mini"),
	require("plugins.neo-tree"),
	require("plugins.telescope"),
	require("plugins.todo"),
	require("plugins.treesitter"),
	require("plugins.which-key"),
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				compile = true,
				theme = "lotus",
			})
			vim.cmd("colorscheme kanagawa")
		end,
		build = function()
			vim.cmd("KanagawaCompile")
		end,
	},
	-- require("plugins.copilot"),
})
