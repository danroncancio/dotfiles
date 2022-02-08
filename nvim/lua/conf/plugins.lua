local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
    	"git",
    	"clone",
    	"--depth",
    	"1",
    	"https://github.com/wbthomason/packer.nvim",
    	install_path,
  	}
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
	augroup packer_user_config
		autocmd!
	    autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Install plugins
return packer.startup(function(use)
	use "wbthomason/packer.nvim" -- Plugin manager

	use "neovim/nvim-lspconfig" -- LSP config
	use "williamboman/nvim-lsp-installer"
	
	use "hrsh7th/nvim-cmp" -- Completion plugin
	use "hrsh7th/cmp-buffer" 
	use "hrsh7th/cmp-path" 
	use "hrsh7th/cmp-cmdline" 
	use "L3MON4D3/LuaSnip" -- Snippet engine
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"
	use "saadparwaiz1/cmp_luasnip"
	use "rafamadriz/friendly-snippets"

	use "nvim-telescope/telescope.nvim" -- Fuzzy finder
	use "nvim-lua/plenary.nvim"
	use "nvim-lua/popup.nvim"
	use "nvim-telescope/telescope-media-files.nvim"

	use "windwp/nvim-autopairs"

	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}

	use "morhetz/gruvbox" -- Colorscheme
end)

