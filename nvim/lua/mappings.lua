vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<leader>ce', '<cmd>RustLsp expandMacro<Cr>', { desc = '[E]xpand Macro' })
vim.keymap.set('n', '<leader>cc', '<cmd>RustLsp flyCheck<Cr>', { desc = '[C]heck' })
vim.keymap.set('n', '<leader>ch', '<cmd>RustLsp hover actions<Cr>', { desc = '[H]over' })
vim.keymap.set('n', '<leader>cx', '<cmd>RustLsp explainError<Cr>', { desc = 'E[x]plain Error' })
vim.keymap.set('n', '<leader>cr', '<cmd>RustLsp runnables<Cr>', { desc = '[R]unnables' })
vim.keymap.set('n', '<leader>ct', '<cmd>RustLsp testables<Cr>', { desc = '[T]estables' })
vim.keymap.set('n', '<leader>ct', '<cmd>RustLsp testables<Cr>', { desc = '[T]estables' })
vim.keymap.set('n', '<leader>cA', '<cmd>RustLsp codeAction<Cr>', { desc = 'Rust code [A]ction' })
vim.keymap.set('n', '<leader>cD', '<cmd>RustLsp renderDiagnostic<Cr>', { desc = '[D]iagnostic' })
vim.keymap.set('n', '<leader>cd', '<cmd>RustLsp debuggables<Cr>', { desc = '[d]ebug' })
vim.keymap.set('n', '<leader>/', 'gcc', { desc = 'Toggle Comment', remap = true })
vim.keymap.set('v', '<leader>/', 'gc', { desc = 'Toggle comment', remap = true })
vim.keymap.set('n', '<leader>w', '<cmd>w!<CR>', { desc = 'Save' })
vim.keymap.set('n', '<Leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'Neotree toggl[e]' })
vim.keymap.set('n', '<Leader>n', '<Cmd>Neotree reveal<CR>', { desc = '[N]eotree toggle' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.api.nvim_set_keymap('n', '<Tab>', '<C-W>W', { noremap = true, silent = true })
