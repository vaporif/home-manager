-- LSP
vim.keymap.set('n', '<leader>ce', '<cmd>RustLsp expandMacro<Cr>', { desc = '[E]xpand Macro' })
vim.keymap.set('n', '<leader>cc', '<cmd>RustLsp flyCheck<Cr>', { desc = '[C]heck' })
vim.keymap.set('n', '<leader>ch', '<cmd>RustLsp hover actions<Cr>', { desc = '[H]over' })
vim.keymap.set('n', '<leader>cx', '<cmd>RustLsp explainError<Cr>', { desc = 'E[x]plain Error' })
vim.keymap.set('n', '<leader>cr', '<cmd>RustLsp runnables<Cr>', { desc = '[R]unnables' })
vim.keymap.set('n', '<leader>ct', '<cmd>RustLsp testables<Cr>', { desc = '[T]estables' })
vim.keymap.set('n', '<leader>ca', '<cmd>RustLsp codeAction<Cr>', { desc = '[A]ction' })
vim.keymap.set('n', '<leader>cD', '<cmd>RustLsp renderDiagnostic<Cr>', { desc = '[D]iagnostic' })
vim.keymap.set('n', '<leader>cd', '<cmd>RustLsp debuggables<Cr>', { desc = '[D]ebug' })
vim.keymap.set('n', '<leader>cd', '<cmd>RustLsp logFile<Cr>', { desc = '[L]og file' })

vim.keymap.set('n', '<leader>ci', '<cmd>AnsiEsc<Cr>', { desc = 'Ans[i] escape' })
vim.keymap.set('n', '<leader>v', '<cmd>DiffviewOpen<Cr>', { desc = 'diff' })
vim.keymap.set('n', '<leader>/', 'gcc', { desc = 'Toggle Comment', remap = true })
vim.keymap.set('v', '<leader>/', 'gc', { desc = 'Toggle comment', remap = true })
vim.keymap.set('n', '<leader>w', '<cmd>w!<CR>', { desc = 'Save' })

vim.keymap.set('n', '<Leader>e', '<Cmd>Neotree float toggle reveal_force_cwd<CR>', { desc = 'Tree toggl[e]' })
vim.keymap.set('n', '<Leader>a', '<Cmd>Neotree float git_status toggle reveal<CR>', { desc = 'Git st[a]tus' })

-- Buffers
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { noremap = true, desc = '[N]ext buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { noremap = true, desc = '[P]revious buffer' })
vim.keymap.set('n', '<leader>bb', '<C-^>', { noremap = true, desc = 'Toggle previous [b]uffer' })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { noremap = true, desc = 'Close current' })
vim.keymap.set('n', '<leader>bo', ':%bd|e#|bd#<CR>', { noremap = true, desc = 'Close except current' })
vim.keymap.set('n', '<leader>st', '<C-w>w', { noremap = true, desc = '[T]oggle splits' })
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { noremap = true, desc = 'Split [v]ertically' })
vim.keymap.set('n', '<leader>sh', ':split<CR>', { noremap = true, desc = 'Split [h]orizontally' })
vim.keymap.set('n', '<leader>m', '<C-w>w', { noremap = true, desc = 'Split toggle' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = '[Q]uickfix list' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>s', ':SearchAndSub<CR>', { noremap = true, silent = true, desc = '[M]ulti replace' })
vim.keymap.set('n', '<leader>co', function()
  for _, client in pairs(vim.lsp.get_clients()) do
    vim.lsp.stop_client(client.id)
  end

  vim.cmd 'LspStart'
end, { desc = 'Lsp st[o]p-start' })
