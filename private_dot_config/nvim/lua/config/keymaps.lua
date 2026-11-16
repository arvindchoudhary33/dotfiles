vim.keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, { desc = "Next Diagnostic" })

vim.keymap.set("n", "sv", "<C-w>v", { desc = "Split window vertically" })

vim.keymap.set("n", ";f", "<cmd>FzfLua files<cr>", { desc = "Find files" })
vim.keymap.set("n", ";r", "<cmd>FzfLua live_grep<cr>", { desc = "Live grep" })

vim.keymap.set("n", "gt", vim.cmd.tabnext, { desc = "Next tab" })
vim.keymap.set("n", "gT", vim.cmd.tabprevious, { desc = "Previous tab" })
vim.keymap.set("n", "<leader>tn", vim.cmd.tabnew, { desc = "New tab" })
vim.keymap.set("n", "<leader>tc", vim.cmd.tabclose, { desc = "Close tab" })
vim.keymap.set("n", "<C-S-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<C-S-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<C-S-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<C-S-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

local transparency_enabled = false
vim.keymap.set("n", "<leader>tt", function()
	transparency_enabled = not transparency_enabled

	local colorscheme = vim.g.colors_name or "default"

	if vim.startswith(colorscheme, "xcodium") then
		local xcodium = require("xcodium")
		local current_opts = require("xcodium.config").options
		xcodium.load(vim.tbl_extend("force", current_opts, { transparent = transparency_enabled }))
	elseif vim.startswith(colorscheme, "solarized-osaka") then
		local osaka = require("solarized-osaka")
		osaka.setup(vim.tbl_extend("force", osaka.config or {}, { transparent = transparency_enabled }))
		vim.cmd.colorscheme(colorscheme)
	elseif colorscheme == "gruvbox" then
		local gruvbox = require("gruvbox")
		gruvbox.setup(vim.tbl_extend("force", gruvbox.config, { transparent_mode = transparency_enabled }))
		vim.cmd.colorscheme("gruvbox")
	elseif colorscheme == "bamboo" then
		require("bamboo").setup({ transparent = transparency_enabled })
		vim.cmd.colorscheme("bamboo")
	elseif colorscheme == "cyberdream" then
		require("cyberdream").setup({ transparent = transparency_enabled })
		vim.cmd.colorscheme("cyberdream")
	elseif colorscheme == "rose-pine" or colorscheme == "rose-pine-moon" then
		local rp = require("rose-pine")
		rp.setup(
			vim.tbl_extend(
				"force",
				rp.get_config and rp.get_config() or {},
				{ disable_background = transparency_enabled }
			)
		)
		vim.cmd.colorscheme("rose-pine-moon")
	else
		vim.notify("Transparency toggle not supported for " .. colorscheme, vim.log.levels.WARN)
	end

	vim.notify("Transparency " .. (transparency_enabled and "enabled" or "disabled"))
end, { desc = "Toggle transparency" })
