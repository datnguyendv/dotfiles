return {
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		ft = { "markdown" },
		config = function()
			vim.g.mkdp_auto_start = 1 -- Tự động bật preview khi mở file Markdown
		end,
	},
}
