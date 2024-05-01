return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.6',
    keys = {
	    {
		    "<leader>pf",
		    function()
			    require("telescope.builtin").find_files()
		    end,
		    desc = "Find Files",
	    },
	    {
		    "<leader>pg",
		    function()
			    require("telescope.builtin").git_files()
		    end,
		    desc = "Find Files",
	    },
	    {
		    "<leader>ps",
		    function()
			    require("telescope.builtin").grep_string({
				    search = vim.fn.input("Grep > ")
			    })
		    end,
		    desc = "Find Files",
	    },
    }
}
