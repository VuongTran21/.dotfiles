return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require('nvim-treesitter.configs').setup({
			build = ':TSUpdate',
			auto_install = true,
		})
	end
}
