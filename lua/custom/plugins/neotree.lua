return {
  'nvim-neo-tree/neo-tree.nvim',
  opts = {
    window = {
      mappings = {
        ['a'] = { 'add', config = { show_path = 'relative' } },
        ['c'] = { 'copy', config = { show_path = 'relative' } },
        ['m'] = { 'move', config = { show_path = 'relative' } },
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      hide_dotfiles = false,
      hide_gitignored = false,
      visible = true,
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
}
