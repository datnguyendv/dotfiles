return {
	{
		"hashivim/vim-terraform",
		config = function()
			vim.g.terraform_fmt_on_save = 1 -- Tự động format khi lưu
			vim.g.terraform_align = 1 -- Căn chỉnh các phần tử trong Terraform
		end,
		lazy = false, -- Load plugin ngay lập tức
	},
}
