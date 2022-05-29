set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua << EOF
-- Neogit
require("neogit").setup {
    integrations = {
        diffview = true
    }
}
EOF
