return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    require("dashboard").setup({
      theme = "hyper",
      config = {
        week_header = {
          enable = true,
          concat = '"The best way to predict the future is to create it."',
        },
        shortcut = {
          {
            desc = "󰱼  Find File",
            group = "@property",
            action = "LazyVim.pick()()",
            key = "f",
          },
          {
            desc = "  Find Text",
            group = "@property",
            action = 'LazyVim.pick("live_grep")()',
            key = "w",
          },
          {
            desc = "  Projects",
            group = "@property",
            action = 'LazyVim.pick("projects")()',
            key = "p",
          },
          {
            desc = "󰒲  Lazy",
            group = "@property",
            action = "Lazy",
            key = "x",
          },
          {
            desc = "  Lazy Extras",
            group = "@property",
            action = "LazyExtras",
            key = "l",
          },
          {
            desc = "  Config",
            group = "@property",
            action = "edit ~/.config/nvim",
            key = "c",
          },
          {
            desc = "  Quit",
            group = "@property",
            action = "qa",
            key = "q",
          },
        },
        packages = { enable = true }, -- show how many plugins installed
        project = {
          enable = true,
          limit = 8,
          icon = "",
          label = " Recent Projects",
          action = 'LazyVim.pick("files", { root = false })()',
        },
        mru = { limit = 10, icon = "", label = " Recent Files", cwd_only = true },
      },
    })
    vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#e69d4e", bold = true })
    vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#a6e3a1", italic = true })

    vim.api.nvim_set_hl(0, "DashboardProjectTitle", { fg = "#89dceb", bold = true })
    vim.api.nvim_set_hl(0, "DashboardProjectIcon", { fg = "#f9e2af" })
    vim.api.nvim_set_hl(0, "DashboardProjectTitleIcon", { fg = "#f9e2af" })

    vim.api.nvim_set_hl(0, "DashboardMruTitle", { fg = "#89dceb", bold = true })
    vim.api.nvim_set_hl(0, "DashboardMruIcon", { fg = "#f9e2af" })
    vim.api.nvim_set_hl(0, "DashboardMruTitleIcon", { fg = "#f9e2af" })

    vim.api.nvim_set_hl(0, "DashboardFiles", { fg = "#cdd6f4" })
    vim.api.nvim_set_hl(0, "DashboardFilesTitle", { fg = "#89b4fa", bold = true })
    vim.api.nvim_set_hl(0, "DashboardFilesIcon", { fg = "#f5c2e7" })
    vim.api.nvim_set_hl(0, "DashboardFilesTitleIcon", { fg = "#fab387" })

    vim.api.nvim_set_hl(0, "DashboardShortCut", { fg = "#94e2d5" })
    vim.api.nvim_set_hl(0, "DashboardShortCutIcon", { fg = "#ee80c2" })
    vim.api.nvim_set_hl(0, "DashboardShortCutKey", { fg = "#f38ba8", bold = true })
  end,
}
