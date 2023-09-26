-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

use {
  'nvim-telescope/telescope.nvim', tag = '0.1.3',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}
use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
use {'ryanoasis/vim-devicons'}

use { "catppuccin/nvim", as = "catppuccin" }

use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
}
  --> LSP and completion
  use({ "williamboman/mason.nvim" })
  use("williamboman/mason-lspconfig.nvim")
  use("neovim/nvim-lspconfig") --> Collection of configurations for built-in LSP client
  use("tami5/lspsaga.nvim") --> icons for LSP diagnostics
  use("onsails/lspkind-nvim") --> vscode-like pictograms for neovim lsp completion items
  use("hrsh7th/nvim-cmp") --> Autocompletion plugin
  use("hrsh7th/cmp-nvim-lsp") --> LSP source for nvim-cmp
  use("saadparwaiz1/cmp_luasnip") --> Snippets source for nvim-cmp
  use("L3MON4D3/LuaSnip") --> Snippets plugin
end)
