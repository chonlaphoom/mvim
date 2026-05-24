return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<Tab>",
					next = "<C-j>",
					prev = "<C-k>",
					dismiss = "<C-x>",
				},
			},
			panel = { enabled = false },
			copilot_model = "gpt-4o-copilot",
			server_opts_overrides = {
				root_dir = function(fname)
					local git_path = vim.fs.find(".git", { upward = true, path = fname })[1]
					return git_path and vim.fs.dirname(git_path) or vim.loop.cwd()
				end,
			},
		})
	end,
}
