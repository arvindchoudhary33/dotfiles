return {

  { "goolord/alpha-nvim", enabled = false },
  { "nvim-mini/mini.starter", enabled = false },
  { "nvim-mini/mini.animate", enabled = false },
  { "rcarriga/nvim-notify", enabled = false },

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "xcodium",
        section_separators = { left = "", right = "" },
      },
    },
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

}
