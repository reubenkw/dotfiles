vim.opt.winborder = "rounded"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.swapfile = false
vim.opt.smartindent = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('i', 'kj', '<ESC>')
vim.keymap.set('n', '<leader>w', ':wa<CR>')
vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format)

vim.pack.add({
	{ src = "https://github.com/rebelot/kanagawa.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/cbochs/grapple.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mbbill/undotree" },
})

vim.cmd("colorscheme kanagawa")

local grapple = require("grapple")
grapple.setup({ icons = false })
vim.keymap.set("n", "<leader>A", grapple.toggle)
vim.keymap.set("n", "<leader>a", grapple.toggle_tags)
vim.keymap.set("n", "<leader>1", "<cmd>Grapple select index=1<cr>")
vim.keymap.set("n", "<leader>2", "<cmd>Grapple select index=2<cr>")
vim.keymap.set("n", "<leader>3", "<cmd>Grapple select index=3<cr>")
vim.keymap.set("n", "<leader>4", "<cmd>Grapple select index=4<cr>")
vim.keymap.set("n", "<leader>5", "<cmd>Grapple select index=5<cr>")
vim.keymap.set("n", "<leader>6", "<cmd>Grapple select index=6<cr>")

local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", telescope.find_files)
vim.keymap.set("n", "<leader>pg", telescope.git_files)
vim.keymap.set("n", "<leader>ps", telescope.live_grep)

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client
				and client.supports_method
				and client:supports_method('textDocument/completion')
				and vim.lsp.completion
				and vim.lsp.completion.enable
		then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
vim.cmd("set completeopt+=noselect")

vim.lsp.enable({
	"lua_ls",
	"rust_analyzer",
})
vim.lsp.set_log_level("ERROR")
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true)
			}
		},
	}
})

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.api.nvim_create_user_command("DiagnosticToggle", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config {
		virtual_text = not vt,
		underline = not vt,
		signs = not vt,
	}
end, { desc = "toggle diagnostic" })
