return {
	{
		dir = vim.fn.expand("~/projects/xcodium.nvim"),
		cond = vim.fn.isdirectory(vim.fn.expand("~/projects/xcodium.nvim")) == 1,
		name = "xcodium",
		lazy = false,
		priority = 1000,
		config = function()
			require("xcodium").setup()
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 999,
		opts = {
			transparent_mode = true,
			contrast = "hard",
		},
	},
	{
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 999,
		config = function()
			require("bamboo").setup({
				transparent = false,
				style = "vulgaris",
				code_style = {
					comments = { italic = true },
					conditionals = { italic = true },
					keywords = {},
					functions = {},
					namespaces = { italic = true },
					parameters = { italic = true },
					strings = {},
					variables = {},
				},
			})
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 999,
		config = function()
			require("rose-pine").setup({
				variant = "main",
				styles = {
					italic = false,
				},
			})
		end,
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 999,
		opts = {
			transparent = false,
			italic_comments = true,
		},
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 999,
		config = function()
			require("solarized-osaka").setup({
				transparent = false,
				terminal_colors = true,
				styles = {
					comments = { italic = true },
				},
			})
		end,
	},
}
