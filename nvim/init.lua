require("options")
require("keymaps")
require("lazy-setup")

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
-- vim: ts=2 sts=2 sw=2 et
