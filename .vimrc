
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'google/vim-searchindex'
Plug 'google/vim-coverage'
Plug 'google/vim-coverage'
Plug 'google/vim-codereview'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'fatih/vim-go'
Plug 'triglav/vim-visual-increment'
Plug 'google/vim-colorscheme-primary'
Plug 'udalov/kotlin-vim'


Plug 'ycm-core/YouCompleteMe'

Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'

Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'dense-analysis/ale'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
" Plug 'junegunn/fzf'


call plug#end()

set number
set relativenumber

set expandtab
set tabstop=4

set tw=5000
colorscheme dracula
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'r': ['R', '--slave', '-e', 'languageserver::run()'],
    \ }


nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

set nrformats=alpha

syntax enable
set t_Co=256
set background=dark
colorscheme primary
