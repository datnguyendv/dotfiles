return {
	-- Other plugins can go here
	{
		"mfussenegger/nvim-ansible",
		ft = { "yaml", "yml" },
		lazy = false, -- Load the plugin eagerly
		keys = {
			{
				"<leader>ta",
				function()
					require("ansible").run()
				end,
				desc = "Ansible Run Playbook/Role",
				silent = true,
			},
		},
	},
}
