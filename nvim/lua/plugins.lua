local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
print(install_path)
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	-- Colorschemes.
	use 'dracula/vim'
	use 'jnurmine/Zenburn'
	use 'gosukiwi/vim-atom-dark'
	use 'ciaranm/inkpot'
	use 'kaicataldo/material.vim'
	use 'artanikin/vim-synthwave84'
	use 'romgrk/doom-one.vim'
	use 'onsails/lspkind-nvim'
	use 'edeneast/nightfox.nvim'
	use 'christianchiarulli/nvcode-color-schemes.vim'
  use "folke/tokyonight.nvim"
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "rose-pine/neovim"
  use "rebelot/kanagawa.nvim"
  use 'Pocco81/Catppuccino.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
  use 'williamboman/nvim-lsp-installer'
  use { 'tami5/lspsaga.nvim', branch = 'nvim6.0' }

	-- GUI
	use 'mhinz/vim-startify'
	use 'terrortylor/nvim-comment'
	use 'folke/todo-comments.nvim'
	use 'AckslD/nvim-neoclip.lua' -- Clipboard.
  -- StatusLine
  use "nvim-lualine/lualine.nvim"
  use "SmiteshP/nvim-gps"



  -- File Tree
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
      config = function() require'nvim-tree'.setup {} end
  }

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

	-- Power Line
	--use 'famiu/feline.nvim', { 'branch': 'develop' }
	  use {
	    'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
	    requires = {'kyazdani42/nvim-web-devicons'}
	  }

	-- Zen mode
	use 'folke/zen-mode.nvim'

	-- Telescope
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'

	-- Treesitter
	-- Post-install/update hook with neovim command
  	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'p00f/nvim-ts-rainbow'
	use 'nvim-treesitter/playground'

	-- Utils
	use 'tpope/vim-surround'

	-- TODO ADD THESE
	--use 'ray-x/navigator.lua'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

