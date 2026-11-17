return {
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "kanagawa-dragon",
		},
	},

	{ "folke/trouble.nvim", enabled = false },

	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
		},
	},

	-- nvim-cmp removed: LazyVim now uses blink.cmp

	{
		"nvim-telescope/telescope.nvim",
		keys = {
			{
				"<leader>fp",
				function()
					require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
				end,
				desc = "Find Plugin File",
			},
		},
		opts = {
			defaults = {
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		opts = function(_, opts)
			opts.servers = opts.servers or {}

			-- Ruff for linting and formatting
			opts.servers.ruff = {
				settings = {
					organizeImports = false, -- Let pyright handle this
				},
			}

			-- Pyright for type checking and import resolution
			opts.servers.pyright = {
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic",
							autoImportCompletions = true,
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						},
					},
				},
			}
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"bash",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			})
		end,
	},

	{
		"mason-org/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"stylua",
				"shellcheck",
				"shfmt",
			})
		end,
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	{ "akinsho/git-conflict.nvim", version = "*", config = true },
}
