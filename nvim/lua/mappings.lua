-- LSP
vim.keymap.set('n', '<leader>ce', '<cmd>RustLsp expandMacro<Cr>', { desc = '[e]xpand macro' })
vim.keymap.set('n', '<leader>cc', '<cmd>RustLsp flyCheck<Cr>', { desc = '[c]heck' })
vim.keymap.set('n', '<leader>ch', '<cmd>RustLsp hover actions<Cr>', { desc = '[h]over' })
vim.keymap.set('n', '<leader>cx', '<cmd>RustLsp explainError<Cr>', { desc = 'e[x]plain error' })
vim.keymap.set('n', '<leader>cr', '<cmd>RustLsp runnables<Cr>', { desc = '[r]unnables' })
vim.keymap.set('n', '<leader>ct', '<cmd>RustLsp testables<Cr>', { desc = '[t]estables' })
vim.keymap.set('n', '<leader>ca', '<cmd>RustLsp codeAction<Cr>', { desc = '[a]ction' })
vim.keymap.set('n', '<leader>cD', '<cmd>RustLsp renderDiagnostic<Cr>', { desc = '[D]iagnostic' })
vim.keymap.set('n', '<leader>cd', '<cmd>RustLsp debuggables<Cr>', { desc = '[d]ebug' })
vim.keymap.set('n', '<leader>cd', '<cmd>RustAnalyzer restart<Cr>', { desc = 'rust-lsp [R]estart' })
vim.keymap.set('n', '<leader>cl', '<cmd>DiffviewOpen<Cr>', { desc = 'diff too[l]' })
vim.keymap.set('n', '<leader>ci', '<cmd>AnsiEsc<Cr>', { desc = 'ans[i] escape' })
vim.keymap.set('n', '<leader>ck', vim.diagnostic.setloclist, { desc = 'quic[k]fix list' })

vim.keymap.set('n', '<leader>/', 'gcc', { desc = 'toggle comment', remap = true })
vim.keymap.set('v', '<leader>/', 'gc', { desc = 'toggle comment', remap = true })
vim.keymap.set('n', '<leader>w', '<cmd>w!<CR>', { desc = 'write' })

vim.keymap.set('n', '<Leader>e', '<Cmd>Neotree float toggle reveal_force_cwd<CR>', { desc = 'Tree toggl[e]' })
vim.keymap.set('n', '<Leader>G', '<Cmd>Neotree float git_status toggle reveal<CR>', { desc = '[G]it status' })

-- Buffers
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { noremap = true, desc = '[n]ext buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { noremap = true, desc = '[p]revious buffer' })
vim.keymap.set('n', '<leader>bb', '<C-^>', { noremap = true, desc = 'Toggle [b]uffer' })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { noremap = true, desc = '[d]elete current' })
vim.keymap.set('n', '<leader>bo', ':%bd|e#|bd#<CR>', { noremap = true, desc = 'cl[o]se except current' })
vim.keymap.set('n', '<leader><Tab>', '<C-w>w', { noremap = true, desc = 'tab buffers' })
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { noremap = true, desc = '[v]ertically' })
vim.keymap.set('n', '<leader>sh', ':split<CR>', { noremap = true, desc = '[h]orizontally' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>m', ':SearchAndSub<CR>', { noremap = true, silent = true, desc = '[m]ulti replace' })

-- subversive
vim.keymap.set('n', 's', '<Plug>(SubversiveSubstitute)', {})
vim.keymap.set('n', 'ss', '<Plug>(SubversiveSubstituteLine)', {})
vim.keymap.set('n', 'S', '<Plug>(SubversiveSubstituteToEndOfLine)', {})
vim.keymap.set('x', 's', '<Plug>(SubversiveSubstitute)', {})
