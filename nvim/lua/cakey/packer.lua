

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

use {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use({
	'folke/tokyonight.nvim',
	as = 'tokyonight',
	config = function()
		vim.cmd('colorscheme tokyonight-night')
	end})
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use('theprimeagen/harpoon')
use('mbbill/undotree')

use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
{'williamboman/mason.nvim'}, -- lsp
{'williamboman/mason-lspconfig.nvim'}, -- lsp

    {'neovim/nvim-lspconfig'}, -- lsp
    {'hrsh7th/nvim-cmp'}, -- autocomp
    {'hrsh7th/cmp-nvim-lsp'}, -- auto comp
    {'hrsh7th/cmp-buffer'}, -- atuo comp
    {'hrsh7th/cmp-path'}, -- autocomp
    {'hrsh7th/cmp-nvim-lua'}, -- autocomp
    {'L3MON4D3/LuaSnip'}, -- snippets
    {'saadparwaiz1/cmp_luasnip'}, -- auto comp
    {'rafamadriz/friendly-snippets'}, -- snippets
  }
}
use {'tpope/vim-fugitive'}

end)
