return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  cmd = { "ObsidianNew", "ObsidianToday", "ObsidianSearch", "ObsidianQuickSwitch", "ObsidianTemplate", "ObsidianBacklinks", "ObsidianLinks" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "watermelon",
        path = "~/Documents/obsidian/watermelon",
      },
    },
    notes_subdir = "notes",
    daily_notes = {
      folder = "daily",
      date_format = "%Y-%m-%d",
    },
    new_notes_location = "notes_subdir",
    completion = {
      nvim_cmp = false,
      min_chars = 2,
    },
    mappings = {
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      ["<leader>oc"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },
  },
  keys = {
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New note" },
    { "<leader>oo", "<cmd>ObsidianQuickSwitch<cr>", desc = "Open note" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search notes" },
    { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Daily note" },
    { "<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "Insert template" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Backlinks" },
    { "<leader>ol", "<cmd>ObsidianLinks<cr>", desc = "Links" },
  },
}
