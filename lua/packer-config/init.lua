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

use {'nvim-tree/nvim-web-devicons'}
use {'nvim-tree/nvim-tree.lua'}
  --> LSP and completion
  use 'neovim/nvim-lspconfig'
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    --- Uncomment these if you want to manage LSP servers from neovim
     {'williamboman/mason.nvim'},
     {'williamboman/mason-lspconfig.nvim'},

    -- LSP Support
    {'neovim/nvim-lspconfig'},
  }
}
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'
use "L3MON4D3/LuaSnip"
use "rafamadriz/friendly-snippets"

require('packer').use { 'mhartington/formatter.nvim' }
end)
