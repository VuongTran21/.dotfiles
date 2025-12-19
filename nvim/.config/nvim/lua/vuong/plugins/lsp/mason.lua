return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
	ensure_installed = {
	    "lua_ls",
	    "html",
	    "cssls",
	    "graphql",
	    "emmet_ls",
	    "ts_ls",
	    "intelephense",
	    "eslint",
	    "pyright",
	},
    },
    dependencies = {
	{

	    "williamboman/mason.nvim",
	    opts = {
		ui = {
		    icons = {
			package_installed = "v",
			package_pending = "->",
			package_uninstalled = "x"
		    },
		},
	    },
	},
	{
	    "neovim/nvim-lspconfig"
	},
    }
}
