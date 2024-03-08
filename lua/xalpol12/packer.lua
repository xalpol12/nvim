-- bootstrap
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd [[packadd packer.nvim]]
      return true
    end
    return false
  end
  local packer_bootstrap = ensure_packer()


-- packer setup 
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- essential
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')

  -- lazygit
  use({
      "kdheepak/lazygit.nvim",
      -- optional for floating window border decoration
      requires = {
          "nvim-telescope/telescope.nvim",
          "nvim-lua/plenary.nvim",
      },
      config = function()
          require("telescope").load_extension("lazygit")
      end,
  })

  --interface:
  use {
      'nvim-tree/nvim-tree.lua',
  }
  use 'nvim-tree/nvim-web-devicons'
  use {
      "nvim-lualine/lualine.nvim",
      requires = { "nvim-tree/nvim-web-devicons", opt = true }
  }
  use {
      "folke/which-key.nvim",
      config = function()
          vim.o.timeout = true
          vim.o.timeoutlen = 300
          require("which-key").setup {
          }
      end
  }

  -- themes:
  use {
	  "catppuccin/nvim", as = "catppuccin",
	  config = function()
		  vim.cmd('colorscheme catppuccin-mocha')
	  end
  }
  use {
	  'nyngwang/nvimgelion',
  }
  use {
      "rebelot/kanagawa.nvim"
  }
  use {
      "rose-pine/neovim", as = "rose-pine"
  }

  -- lsp
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      requires = {
          --- Uncomment these if you want to manage LSP servers from neovim
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'L3MON4D3/LuaSnip'},
      }
  }

  -- better diagnostics from lsp
  use { 'folke/trouble.nvim' }

  -- tmux integration
  use {
      'christoomey/vim-tmux-navigator',
      lazy = false,
  }

  -- auto-close brackets
  use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
          require("nvim-autopairs").setup {}
      end
  }


  -- auto setup after cloning config
    if packer_bootstrap then
        require('packer').sync()
    end
  end)
