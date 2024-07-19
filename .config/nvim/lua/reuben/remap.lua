vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "kj", "<Esc>")

vim.api.nvim_create_user_command("DiagnosticToggle", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config {
		virtual_text = not vt,
		underline = not vt,
		signs = not vt,
	}
end, { desc = "toggle diagnostic" })

vim.keymap.set("n", "gp", "oprint(f\"\")<Left><Left>")

vim.keymap.set("i", "(", "()<Esc>ha")
vim.keymap.set("i", "{", "{}<Esc>ha")
vim.keymap.set("i", "[", "[]<Esc>ha")
vim.keymap.set("i", "\"", "\"\"<Esc>ha")
vim.keymap.set("i", "\'", "\'\'<Esc>ha")
vim.keymap.set("i", "`", "``<Esc>ha")

