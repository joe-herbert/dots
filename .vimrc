call plug#begin()
Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0

Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none

Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'elkowar/yuck.vim'
call plug#end()

let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 0
nnoremap - :Ex<CR>
nnoremap _ :q<CR>
augroup markdownSpell
    autocmd!
    autocmd FileType text setlocal spell
    autocmd FileType text set spelllang=en_gb
    autocmd FileType tex setlocal spell
    autocmd FileType tex set spelllang=en_gb
augroup END
set tabstop=4 shiftwidth=4 expandtab
cabbrev tabv tab sview +setlocal\ nomodifiable
set number
set relativenumber
set ai
syntax enable
if has('termguicolors')
    set termguicolors
endif
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
let g:sonokai_transparent_background = 1
colorscheme sonokai
let &t_ut=''
hi Normal guibg=NONE ctermbg=NONE

inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :tabm -1<CR>
nnoremap <silent> <A-Right> :tabm +1<CR>
nnoremap bn :bn<CR>
nnoremap bp :bp<CR>
nnoremap bd :buffers<CR>:bd<Space>
nnoremap bs :b#<CR>
nnoremap bq :bp <BAR> :bd #<CR>
nnoremap bl :ls<CR>
nnoremap bo :buffers<CR>:buffer<Space>
function! RepeatChar(char, count)
  return repeat(a:char, a:count)
endfunction
nnoremap s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap j g<down>
nnoremap k g<up>
nnoremap <F5> gd[{V%::s// "Rename variable inside function
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
nnoremap gR gD:%s/<C-R>///gc<left><left><left>
nnoremap :W :w
nnoremap :Q :q
inoremap <silent> <C-_> <ESC>:silent! normal! mz<Right><Right>b~`z<CR>a
nnoremap <silent> <C-_> :silent! normal! mz<Right>b~`z<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

call vimtex#imaps#add_map({
  \ 'lhs' : '<S-CR>',
  \ 'rhs' : '',
  \ 'leader' : '',
  \ 'wrapper' : 'vimtex#imaps#wrap_environment',
  \ 'context' : [
  \      {'envs' : ["itemize", "enumerate"],
  \       'rhs' : '\item '},
  \      {'envs' : ["tabular", "tabularx"],
  \       'rhs' : "A\\\\\\hline"},
  \      {'envs' : ["document"],
  \       'rhs' : "A\\\\"},
  \ ],
  \})

"  vim sensible
"  coc
"  clipboard
"  airline styles
"  vimagit
"  flog
