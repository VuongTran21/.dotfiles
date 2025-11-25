local Remap = require("utils.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local xnoremap = Remap.xnoremap
local tnoremap = Remap.tnoremap
local nmap = Remap.nmap
local opts = { noremap = true, silent = true }


-- Directory navigation
nnoremap("<leader>e", ":NvimTreeToggle<CR>", opts)
nnoremap("<leader>b", ":NvimTreeFindFile<CR>", opts)

-- Window & Pane navigation
nnoremap("<C-h>", "<C-w>h", opts)
nnoremap("<C-j>", "<C-w>j", opts)
nnoremap("<C-k>", "<C-w>k", opts)
nnoremap("<C-l>", "<C-w>l", opts)

tnoremap("<C-h>", "wincmd h", opts) -- Navigate Left
tnoremap("<C-j>", "wincmd j", opts) -- Navigate Down
tnoremap("<C-k>", "wincmd k", opts) -- Navigate Up
tnoremap("<C-l>", "wincmd l", opts) -- Navigate Right

tnoremap("<C-h>", "TmuxNavigateLeft", opts) -- Navigate Left
tnoremap("<C-j>", "TmuxNavigateDown", opts) -- Navigate Down
tnoremap("<C-k>", "TmuxNavigateUp", opts) -- Navigate Up
tnoremap("<C-l>", "TmuxNavigateRight", opts) -- Navigate Right

-- Window management
nnoremap("<leader>sv", ":vsplit", opts) -- vertically
nnoremap("<leader>sh", ":split", opts) -- horizontally
nnoremap("<leader>sm", ":MazimizerToggle<CR>", opts) -- Mazimizer
nnoremap("<leader>sx", ":close<CR>", opts) -- close current split window
nnoremap("<leader>se", "<C-w>=", opts) -- make splitted window equal width and height

-- Moving, indent text around
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")
vnoremap("<", "<gv", { noremap = true, silent = false })
vnoremap(">", ">gv", { noremap = true, silent = false })

-- delete single character without copying into register
nnoremap("x", '"_x')

-- greatest remap ever from ThePrimagen
xnoremap("<leader>p", '"_dP')
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')
nmap("<leader>Y", '"+Y')
nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')

nnoremap("<leader>q", ":q!<CR>")
nnoremap("<leader>Q", ":wq<CR>")
nnoremap("<leader>w", ":w<CR>")
nnoremap("<leader>x", ":bdelete<CR>")

nnoremap("<leader>lf", "<cmd>lua vim.lsp.buf.format({ name = 'efm', async = true })<CR>", opts)

-- telescope
nnoremap("<leader>ps", "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For >') })<CR>")
nnoremap("<leader>pf", "<cmd>lua require('telescope.builtin').find_files({ hidden = false })<CR>")
nnoremap("<leader>ph", "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>")
nnoremap("<leader>pw", "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })<CR>")
nnoremap("<leader>pb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
nnoremap("<leader>vh", "<cmd>lua require('telescope.builtin').help_tags()<CR>")
nnoremap("<C-p>", "<cmd>lua require('telescope.builtin').git_files()<CR>")

nnoremap("<leader>gc", "<cmd>Telescope git_commits<CR>")
nnoremap("<leader>gfc", "<cmd>Telescope git_bcommits<CR>")
nnoremap("<leader>gb", "<cmd>Telescope git_branches<CR>")
nnoremap("<leader>gs", "<cmd>Telescope git_status<CR>")

-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
-- vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
-- vim.keymap.set('n', '<leader>sS', require('telescope.builtin').git_status, { desc = '' })
-- vim.keymap.set('n', '<leader>sm', ":Telescope harpoon marks<CR>", { desc = 'Harpoon [M]arks' })
-- vim.keymap.set("n", "<Leader>sr", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", silent)
-- vim.keymap.set("n", "<Leader>sR", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
--   silent)
-- vim.keymap.set("n", "<Leader>sn", "<CMD>lua require('telescope').extensions.notify.notify()<CR>", silent)
--
-- vim.api.nvim_set_keymap("n", "st", ":TodoTelescope<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<Leader><tab>", "<Cmd>lua require('telescope.builtin').commands()<CR>", { noremap = false })


-- gitsigns
nnoremap("<leader>grh", "<cmd>Gitsigns reset_hunk<CR>")

-- search and ready to replace all the matching words in curren buffer
nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

