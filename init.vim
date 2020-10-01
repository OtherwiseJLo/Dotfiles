call plug#begin('~/.local/share/nvim/site/pack')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'nvim-lua/lsp-status.nvim'
call plug#end()
set number
set relativenumber

lua require'nvim_lsp'.bashls.setup{}
lua require'nvim_lsp'.clangd.setup{}
lua require'nvim_lsp'.dartls.setup{}
lua require'nvim_lsp'.dockerls.setup{}
lua require'nvim_lsp'.elmls.setup{}
lua require'nvim_lsp'.gopls.setup{}
lua require'nvim_lsp'.jsonls.setup{}
lua require'nvim_lsp'.julials.setup{}
lua require'nvim_lsp'.kotlin_language_server.setup{}
lua require'nvim_lsp'.leanls.setup{}
lua require'nvim_lsp'.metals.setup{}
lua require'nvim_lsp'.ocamllsp.setup{}
lua require'nvim_lsp'.pyls.setup{}
lua require'nvim_lsp'.rls.setup{}
lua require'nvim_lsp'.terraformls.setup{}
lua require'nvim_lsp'.texlab.setup{}
lua require'nvim_lsp'.tsserver.setup{}

autocmd BufEnter * lua require'diagnostic'.on_attach()
autocmd BufEnter * lua require'completion'.on_attach()


let g:diagnostic_enable_virtual_text = 1


" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  refactor = {
    highlight_definitions = { enable = true},  		
    highlight_current_scope = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
	list_definitions = "gnD",
	goto_next_usage = "<a-*>",
	goto_previous_usage = "<a-#>",
      },
    },
  },
  incremental_selection = {
   enable = true,
   keymaps = {
     init_selection = "gnn",
     node_incremental = "grn",
     scope_incremental = "grc",
     node_decremental = "grm",
  },
  },
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

echo nvim_treesitter#statusline(90)  
