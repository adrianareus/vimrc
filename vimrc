set runtimepath^=~/.vim/bundle/ctrlp.vim
"execute pathogen#infect()
syntax on
filetype plugin indent on
set number
set laststatus=2
set t_Co=256
set noshowmode

" ctrlp settings
let g:ctrlp_follow_symlinks=1
let g:ctrlp_max_files=0


" More tabs 
set tabpagemax=20

" Mark tabs and spaces
set list listchars=tab:»\ ,trail:·,extends:»,precedes:«

" Highlight current line
set cursorline

" Open new vertical splits to the right of current one.
set splitright

" autowrite saves file when losing focus (?)
set autowrite
colorscheme zenburn

set runtimepath^=~/.vim/bundle/ctrlp.vim

set pastetoggle=<F8>
"set statusline=%<%f\ %y%h%m%r%=%-24.(0x%02B,%l/%L,%c%V%)\ %P
"set wildmenu

set statusline=
set statusline+=%0*\%{toupper(mode())}                    " Current mode
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
"set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
"set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
"set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
"set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%p%%)\             "Rownumber/total (%)
"set statusline+=%9*\ col:%03c\                            "Colnr
"set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.


" Restore position inside previously opened file.  From vim.wikia.
function! ResCur()
if line("'\"") <= line("$")
      normal! g`"
          return 1
    endif
    endfunction

    augroup resCur
      autocmd!
        autocmd BufWinEnter * call ResCur()
augroup END

" From vim.wikia.com 
" Use TAB to complete when typing words, else inserts TABs as usual.
" Uses dictionary and source files to find matching words to complete.
"
" See help completion for source,
" Note: usual completion is on <C-n> but more trouble to press all the time.
" Never type the same word twice and maybe learn a new spellings!
" Use the Linux dictionary when spelling is in doubt.
" Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
      return "\<C-N>"
        else
          return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"


:nnoremap <S-F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
:set hlsearch
:hi Search ctermbg=DarkBlue
source /home/adriana/cscope_maps.vim
