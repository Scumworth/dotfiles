set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua << EOF
-- Which-Key
local wk = require("which-key")
wk.setup {}
wk.register({
    t = {
        name = "Neotest"      
    },
    s = {
        name = "Spectre",
        s = {
            name = "Search All"
        },
        w = {
            name = "Search for Word"
        },
        p = {
            name = "Search File"
        }
    },
    l = {
        name = "Cursorline"
    },
    c = {
        name = "NerdCommenter"
    },
    C = {
        name = "CoC"
    },
    d = {
        name = "VimSpector"
    },
    g = {
        name = "Neogit"
    },
    q = {
        name = "FZF"
    },
}, { prefix = "<Leader>"})

-- Spectre search
require('spectre').setup()

-- Neogit
require("neogit").setup {
    integrations = {
        diffview = true
    }
}
vim.api.nvim_set_keymap("n", "<Leader>g", "<cmd>Neogit<CR>", {noremap=true})

-- HOP 
-- hop.nvim
require'hop'.setup()
-- normal mode (easymotion-like)
vim.api.nvim_set_keymap("n", "<Leader><Leader>b", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader><Leader>w", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader><Leader>j", "<cmd>HopLineAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader><Leader>k", "<cmd>HopLineBC<CR>", {noremap=true})
-- visual mode (easymotion-like)
vim.api.nvim_set_keymap("v", "<Leader><Leader>w", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<Leader><Leader>b", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<Leader><Leader>j", "<cmd>HopLineAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "<Leader><Leader>k", "<cmd>HopLineBC<CR>", {noremap=true})
-- normal mode (sneak-like)
vim.api.nvim_set_keymap("n", "s", "<cmd>HopChar2AC<CR>", {noremap=false})
vim.api.nvim_set_keymap("n", "S", "<cmd>HopChar2BC<CR>", {noremap=false})
-- visual mode (sneak-like)
vim.api.nvim_set_keymap("v", "s", "<cmd>HopChar2AC<CR>", {noremap=false})
vim.api.nvim_set_keymap("v", "S", "<cmd>HopChar2BC<CR>", {noremap=false})

EOF
" Spectre
nnoremap <leader>ss <cmd>lua require('spectre').open()<CR>
"search current word
nnoremap <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>ss <cmd>:lua require('spectre').open_visual()<CR>
"  search in current file
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<CR>
" run command :Spectre
"
"" Neoterm
let g:neoterm_default_mod = 'botright'
let g:neoterm_autoscroll = '1'
nnoremap <Leader>0 :Ttoggle<CR>
vnoremap <Leader>1 :TREPLSendSelection<CR>
nnoremap <Leader>1 :TREPLSendLine<CR>
nnoremap <Leader>2 :Tmap<CR>
let g:neoterm_automap_keys = '<F5>'
