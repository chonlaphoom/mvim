return { -- Autoformat
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function()
			return {
				timeout_ms = 500,
				lsp_format = true,
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			typescript = { "prettier", "trim_whitespace" },
			javascript = { "prettier", "trim_whitespace" },
			yaml = { "yamlfmt" },
			json = { "prettier" },
			go = { "gofmt" },
			markdown = { "prettier", "trim_whitespace" },
			proto = { "buf" },
		},
		formatter = {
			prettier = {
				require_cwd = true,
			},
		},
	},
}
