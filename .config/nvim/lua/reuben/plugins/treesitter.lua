return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc", "help", "c", "rust", "python" },

		auto_install = true,

		highlight = {
			enable = true,
			use_languagetree = true,
			additional_vim_regex_highlighting = false,
		},

		indent = { enable = true },
	}
}
