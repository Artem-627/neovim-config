-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope
  use {
	  'nvim-telescope/telescope.nvim',
	  tag = '0.1.8',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Cyberdream theme
  use({
	  "scottmckendry/cyberdream.nvim",
  })

  use({
	  'nvim-treesitter/nvim-treesitter',
	  {run = ':TSUpdate'}
  })

  use({'hrsh7th/nvim-cmp'})

  use({'hrsh7th/cmp-nvim-lsp'})

  use {
    "williamboman/mason.nvim"
  }

  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  use({
    'neovim/nvim-lspconfig'
  })

  use({
    'robert-oleynik/clangd-nvim'
  })

  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }

  use({
    "folke/neodev.nvim"
  })
end)
