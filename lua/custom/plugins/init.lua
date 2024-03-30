-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.filetype.add { extensions = { gotmpl = 'yaml' } }

vim.noremap('<C-d>', '<C-d>zz')
vim.noremap('<C-u>', '<C-u>zz')
vim.noremap('<n>', 'nzzzv')
vim.noremap('<N>', 'Nzzzv')

vim.opt.autochdir = true

vim.keymap.set('n', '<leader>p', '"_dP')
vim.keymap.set('n', '<leader>gi', ':Git<CR>')
vim.keymap.set('n', '<leader>gc', ':Git commit<CR>')
vim.keymap.set('n', '<leader>gp', ':Git push<CR>')
vim.keymap.set('n', '<leader>gf', ':Git fetch --all --prune --tags<CR>')
vim.keymap.set('n', '<leader>gl', ':Git pull<CR>')
vim.keymap.set('n', '<leader>ga', ':Git add -A<CR>')
vim.keymap.set('n', '<leader>be', ':B64Encode<CR>')
vim.keymap.set('n', '<leader>bd', ':B64Decode<CR>')
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>')

local function commitWithJira()
  local handle = io.popen 'git branch --show-current'
  local branchName = handle:read '*a'
  handle:close()
  local returnString = ':Git add -A <Bar> :Git commit -m '

  local match = string.match(branchName, '^([^-]+-[^-]+)')
  if match then
    returnString = returnString .. match .. ' <Bar> :Git push<CR>'
  else
    returnString = ''
  end
  return returnString
end
vim.keymap.set('n', '<leader>gg', commitWithJira())
return {}
