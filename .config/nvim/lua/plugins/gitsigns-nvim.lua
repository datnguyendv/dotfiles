return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	config = function()
		require("gitsigns").setup({
			current_line_blame = true, -- Bật tính năng blame cho dòng hiện tại
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- Hiển thị blame ở cuối dòng
				delay = 100, -- Thời gian chờ trước khi hiển thị blame
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
		})
	end,
}
