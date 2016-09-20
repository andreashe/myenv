set tabstop=2
set ts=2
set sw=2
set smartindent
set ruler
set expandtab

" disable menu bar (menu is m)
set guioptions-=T


"       indent to previous line's indentation automatically
set autoindent
"       automatically read files which have changed on the filesystem but not in memory
set autoread
"       write file before starting a new edit
set autowrite
"       allow backspacing over newlines and beyond insert point
set backspace=2
"       don't leave redundant copies lying around.
set nobackup
"       where to put .bak files
set backupdir=.,~/tmp,/tmp

"       try to put .swp files where the file is, or if can't write
"       there, then stick em in /tmp
set directory=.,~/tmp,/tmp

"       ignore case when pattern matching
set ignorecase

set noswapfile

" Jump point macros
" =================
"
"   set a marker (the cursor is left between the marker characters)
"   This is the place to change the jump marks if you want to
imap __Vmark__ <C-V>«<C-V>»
vmap __Vmark__ "zc<C-V>«<C-R>z<C-V>»<ESC>
"   jump to next marker
map __Vjump__ /«[^«»]\{-}»/<CR>a<C-R>=histdel("search",-1)<CR><BS>:"<ESC>h"myt»h@m<C-M>cf»
imap __Vjump__ <ESC>__Vjump__

map <M-.> __Vjump__
imap <M-.> __Vjump__

set noshowmode


syntax on
set guifont=Monospace\ 15
set number
set nowrap
colorscheme darkblue

hi Normal guibg=#000000
hi LineNr guifg=darkcyan

source ~/.vim/colorschemes/charon.vim

set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
:hi Search ctermbg=Yellow
:hi Search guibg=#888800


:ab dosub <ESC>:r ~/.vim/templates/sub<ESC><M-.>

" paste allways the same
map <M-v> "0p

" paste via shift insert
imap <S-Insert> <ESC>"+gPi 
map <S-Insert> "+gP 

" press CTRL+] to jump to a functions def
" press CTRL+o to jump back
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 20
map <F6> :TlistToggle<cr>
map <c-F6> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F3> <c-]>
map <s-F3> <c-o>
map <s-F4> <c-o>

" CSCOPE (backwards, extended tags)
source ~/.vim/cscope_maps.vim
map <F4> <C-Bslash>s
map <c-s-F6> :!find  -name '*.pl' -o -name '*.pm' -o -name '*.t' \| grep -v blib \| cscope -b -q -i - <CR>

" Merge conflict handling
" M-mM-m jump to next merge conflict
" M-mM-, keep left side
" M-mM-. keep right side
" jump to next conflict with M-mM-m again (it sets up markers for deletion)
"
" show merge conflicts, jump to next conflict
map <M-m><M-m> /^<\{7\}\s.*$/<CR>ml/^=\{7\}$/<CR>mr/^>\{7\}\s.*$/<CR>me'lk/^[<=>]\{7\}\(\s.*\)\?$/<CR>z<CR>
" accept the left side (unshifted <)
map <M-m><M-,> 'ldd'rd'e:delmarks lre<CR>
" accept the right side (unshifted >)
map <M-m><M-.> 'ld'r'edd:delmarks lre<CR>

" Folding
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
:highlight Folded guibg=black guifg=DarkSlateGray
:highlight FoldColumn guibg=darkgrey guifg=white

" folders open/close
map <A-Right> zO
map <A-Left> zC
map <A-Up> zM
map <A-Down> zR



" my shortcuts

imap dumper use Data::Dumper;<RETURN>print Dumper(  );


imap sub<TAB> sub  {<RETURN>my $self = shift;<RETURN><RETURN>return;<ESC>hkkkhi

imap .<TAB> ->{''}<ESC>hi
imap -<TAB> ->();<ESC>hhi
imap r<TAB> return;<ESC>i
imap {<TAB> {<RETURN>}<ESC>ka<RETURN>
imap {<RETURN> {<RETURN>}<ESC>O
imap =<TAB> <SPACE>=> <ESC>a
imap ss<TAB> my $self = shift;<RETURN>
imap s<TAB> $self->
imap pp<TAB> my $param = { @_ };<RETURN>
imap ppp<TAB> my $ = $param->{''};<ESC>bbbbba

" clone block
map <M-[>   V%y%p
map <M-p>   !perltidy<RETURN>

" nerdtree tab
map <TAB> gt
map <S-TAB> gT

"
" Special Setting for the width of the taglist window
"

let Tlist_Auto_Open = 0
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Process_File_Always = 1
let Tlist_Sort_Type = "name"
let Tlist_Use_SingleClick = 1

let tlist_perl_settings = "perl;s:Subroutines"

" set status line to include the current tag (function name)
set statusline=%<%f\ %([%{Tlist_Get_Tagname_By_Line()}]%)\ %h%m%r%=%-14.(%l,%c%V%)\ %P

set laststatus=2 

" session tabs
" http://www.vim.org/scripts/script.php?script_id=3150
" use :SaveSession and :OpenSession
let g:session_autosave = 'yes'

