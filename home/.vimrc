set nocompatible" be iMproved
filetype off" required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" vundle plugins
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'tpope/vim-rails.git'
Bundle 'nanotech/jellybeans.vim.git'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'vadv/vim-chef'
Bundle 'scrooloose/nerdtree'
Bundle 'slack/vim-bufexplorer'
Bundle 'kchmck/vim-coffee-script'
Bundle 'skammer/vim-css-color'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'oscarh/vimerl'
Bundle 'nosami/Omnisharp'
Bundle 'tpope/vim-dispatch'
Bundle 'ervandew/supertab.git'
Bundle 'tsaleh/vim-matchit'

colorscheme jellybeans

filetype plugin indent on " required!

scriptencoding utf-8
set nocompatible
syntax on
set incsearch
set hlsearch
set showmatch " flash matching brackets
set smarttab

set directory=/tmp/

set number
setlocal numberwidth=5

" Display extra whitespace
set list listchars=tab:»·,trail:·


" Nice statusbar
set laststatus=2
set statusline=\ "
set statusline+=%f\ " file name
set statusline+=[
set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&fileformat}] " file format
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=%= " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

" enable setting title
set title
" configure title to look like: Vim /path/to/file
set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70

" Make backspace work in insert mode
set backspace=indent,eol,start

" can has foldin plz?
set foldenable
set foldmethod=syntax
set foldlevel=999 " make it really high, so they're not displayed by default

" quit NERDTree after openning a file
let NERDTreeQuitOnOpen=1
" colored NERD Tree
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeShowHidden = 1
" map enter to activating a node
let NERDTreeMapActivateNode='<CR>'
let NERDTreeIgnore=['\.git','\.DS_Store','\.pdf', '.beam']
let NERDTreeShowBookmarks=1

" limit number of results shown for performance
let g:fuzzy_matching_limit=60
" ignore stuff that can't be openned, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;*.beam;vendor/**;coverage/**;tmp/**;rdoc/**"
" increate the number of files scanned for very large projects
let g:fuzzy_ceiling=20000
" display relative path, instead of abbrevated path (lib/jeweler.rb vs
" l/jeweler.rb)
let g:fuzzy_path_display = 'relative_path'

let g:browser = 'open '

augroup myfiletypes
" Clear old autocmds in group
autocmd!
" autoindent with two spaces, always expand tabs
autocmd FileType ruby,eruby,yaml set autoindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType python,cs set autoindent shiftwidth=4 softtabstop=4 expandtab
autocmd FileType javascript,html,htmldjango,css set autoindent shiftwidth=2 softtabstop=2 expandtab
autocmd FileType vim set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType cucumber set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType puppet set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
au BufRead,BufNewFile *etc/nginx/* set ft=nginx
" treat rackup files like ruby
au BufRead,BufNewFile *.ru set ft=ruby
au BufRead,BufNewFile Gemfile set ft=ruby
autocmd BufEnter *.haml setlocal cursorcolumn
au BufRead,BufNewFile Gemfile set ft=ruby
au BufRead,BufNewFile Capfile set ft=ruby
au BufRead,BufNewFile Thorfile set ft=ruby
au BufRead,BufNewFile *.god set ft=ruby
au BufRead,BufNewFile .caprc set ft=ruby
au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

 " When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "normal g`\"" |
\ endi

 " Turn on language specific omnifuncs
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType python,cs set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

 " Tab navigation
nmap <leader>tn :tabnext<CR>
nmap <leader>tp :tabprevious<CR>
nmap <leader>te :tabedit


" Toggle NERDTree with <leader>d
  map <silent> <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings copied from OmniSharp example 
let g:OmniSharp_typeLookupInPreview = 1

"don't autoselect first item in omnicomplete, show if only one item (for
"preview)
set completeopt=longest,menuone,preview
"move the preview window (code documentation) to the bottom of the screen, so
"it doesn't move the code!
:set splitbelow

nnoremap <F5> :wa!<cr>:OmniSharpBuildAsync<cr>
nnoremap <F12> :OmniSharpGotoDefinition<cr>
nnoremap gd :OmniSharpGotoDefinition<cr>
nnoremap <leader>fi :OmniSharpFindImplementations<cr>
nnoremap <leader>ft :OmniSharpFindType<cr>
nnoremap <leader>fs :OmniSharpFindSymbol<cr>
nnoremap <leader>fu :OmniSharpFindUsages<cr>
nnoremap <leader>fm :OmniSharpFindMembersInBuffer<cr>
nnoremap <leader>tt :OmniSharpTypeLookup<cr>
"I find contextual code actions so useful that I have it mapped to the
"spacebar
nnoremap <space> :OmniSharpGetCodeActions<cr>

" rename with dialog
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>
" rename without dialog - with cursor on the symbol to rename... ':Rename
" newname'
"command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
" Force OmniSharp to reload the solution. Useful when switching branches
" etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
nnoremap <leader>tp :OmniSharpAddToProject<cr>
" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp
" server for the current solution
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>
" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>
" "Don't ask to save when changing buffers (i.e. when jumping to a type
" definition)
set hidden

