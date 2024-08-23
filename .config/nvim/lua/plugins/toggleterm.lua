return {
	"akinsho/toggleterm.nvim",
	lazy = false,
	config = function()
		require("toggleterm").setup({
			size = 20, -- Kích thước mặc định của terminal
			open_mapping = [[<leader>tt]], -- Phím tắt để mở terminal (Ctrl + \)
			shade_terminals = true, -- Bật tính năng làm mờ các terminal
			shading_factor = 2, -- Mức độ làm mờ
			start_in_insert = true, -- Bắt đầu ở chế độ insert khi mở terminal
			persist_size = true, -- Lưu lại kích thước terminal giữa các lần mở
			direction = "float", -- Mở terminal theo hướng ngang (horizontal)
			close_on_exit = true, -- Đóng terminal khi lệnh trong terminal kết thúc
			shell = vim.o.shell, -- Sử dụng shell mặc định của hệ thống
			float_opts = {
				border = "curved", -- Kiểu viền của terminal nổi (floating terminal)
				winblend = 3, -- Độ mờ của cửa sổ
			},
		})
	end,
}
