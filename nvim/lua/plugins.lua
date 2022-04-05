local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
print(install_path)
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	-- Telescope
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
  -- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	-- Treesitter
	-- Post-install/update hook with neovim command
  	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'p00f/nvim-ts-rainbow'
	use 'nvim-treesitter/playground'

	-- Colorschemes.
	use 'dracula/vim'
	use 'jnurmine/Zenburn'
	use 'gosukiwi/vim-atom-dark'
	use 'ciaranm/inkpot'
	use 'kaicataldo/material.vim'
	use 'artanikin/vim-synthwave84'
	use 'romgrk/doom-one.vim'
	use 'edeneast/nightfox.nvim'
	use 'christianchiarulli/nvcode-color-schemes.vim'
  use "folke/tokyonight.nvim"
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "rose-pine/neovim"
  use "rebelot/kanagawa.nvim"
  use 'Pocco81/Catppuccino.nvim'

	-- git
	use 'f-person/git-blame.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'williamboman/nvim-lsp-installer'
  use { 'tami5/lspsaga.nvim', branch = 'nvim6.0' }
	use 'onsails/lspkind-nvim'

	-- Autocompletion
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

	-- GUI
	use 'mhinz/vim-startify'
	use 'terrortylor/nvim-comment'
	use 'folke/todo-comments.nvim'
	use {
		"AckslD/nvim-neoclip.lua",
		requires = {
			{'tami5/sqlite.lua', module = 'sqlite'}
		}
	}

	use 'jiangmiao/auto-pairs'
  -- StatusLine
  use "SmiteshP/nvim-gps"
	use {'nvim-lualine/lualine.nvim'}

  -- Projecting
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

	-- Icons
	use 'ryanoasis/vim-devicons'
	use 'kyazdani42/nvim-web-devicons'

  -- File Tree
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
  }

	-- Zen mode
	use 'folke/zen-mode.nvim'


	-- Utils
	use 'tpope/vim-surround'

	-- TODO ADD THESE
	--use 'ray-x/navigator.lua'


  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup {
      }
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

