return {
  'EvWilson/spelunk.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'folke/snacks.nvim',
  },
  config = function()
    require('spelunk').setup({
      enable_persist = true,
      fuzzy_search_provider = 'telescope',
      base_mappings = {
        toggle = '<leader>Bt',
        add = '<leader>Ba',
        delete = '<leader>Bd',
        next_bookmark = '<leader>Bn',
        prev_bookmark = '<leader>Bp',
        search_bookmarks = '<leader>Bf',
        search_current_bookmarks = '<leader>Bc',
        search_stacks = '<leader>Bs',
        change_line = '<leader>Bl',
      },
    })
  end,
}
