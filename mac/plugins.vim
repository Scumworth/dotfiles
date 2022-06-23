call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'puremourning/vimspector'
Plug 'folke/which-key.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'junegunn/gv.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'cocopon/iceberg.vim'
Plug 'windwp/nvim-spectre'
Plug 'gkeep/iceberg-dark'
Plug 'olical/conjure'
Plug 'wlangstroth/vim-racket'
Plug 'ap/vim-css-color'
Plug 'burntsushi/erd'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'phaazon/hop.nvim'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimwiki/vimwiki'
Plug 'scrooloose/nerdcommenter'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'epmatsw/ag.vim'
Plug 'vimwiki/vimwiki'
Plug 'kassio/neoterm'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'francoiscabrol/ranger.vim'
Plug 'TimUntersberger/neogit'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-sleuth'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
call plug#end()
