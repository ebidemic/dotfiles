"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.cache/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/vimfiler.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('vim-scripts/VimClojure')
call dein#add('davidhalter/jedi-vim')
call dein#add('h1mesuke/unite-outline')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('hokaccha/vim-html5validator')
call dein#add('itchyny/lightline.vim')
call dein#add('jpalardy/vim-slime')
call dein#add('kannokanno/previm')
call dein#add('othree/html5.vim')
call dein#add('plasticboy/vim-markdown')
call dein#add('scrooloose/syntastic')
call dein#add('t9md/vim-textmanip')
call dein#add('tomasr/molokai')
call dein#add('tyru/open-browser.vim')
"call dein#add('yuratomo/w3m.vim')
call dein#add('thinca/vim-quickrun')
call dein#add('lervag/vimtex')
"call dein#add('TwitVim')
call dein#add('vim-scripts/freefem.vim')
"call dein#add('darfink/vim-plist')
"fishのhighlight
call dein#add('dag/vim-fish')
call dein#add('LER0ever/EverVim')
"markdownのプラグイン
"call dein#add('plasticboy/vim-markdown')
" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
call dein#add('mattn/emmet-vim')
call dein#add('mzlogin/vim-markdown-toc')

" Required:
call dein#end()

" Required:
filetype plugin indent on
set number
syntax enable
" colorscheme molokai
set t_Co=256
set laststatus=2
set backspace=2
set tabstop=4
set shiftwidth=4
set expandtab
" 折りたたみ
set foldmethod=syntax
let perl_fold=1
set foldlevel=100 "Don't autofold anything

let g:Tex_DefaultTargetFormat = 'pdf'
let mapleader = "\<Space>"
"vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1
"macのクリップボードにヤンク
set clipboard=unnamed,autoselect


" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"End dein Scripts-------------------------

"Fortran設定
let fortran_free_source=1
let fortran_fold=1
au! BufRead,BufNewFile *.f90 let b:fortran_do_enddo=1

"plistファイルの設定
"let g:plist_display_format = 'xml'

" Open junk file."{{{
command! -nargs=0 JunkFile call s:open_junk_file()
function! s:open_junk_file()
  let l:junk_dir = $HOME . '/.vim_junk'. strftime('/%Y/%m')
  if !isdirectory(l:junk_dir)
    call mkdir(l:junk_dir, 'p')
  endif

  let l:filename = input('Junk Code: ', l:junk_dir.strftime('/%Y-%m-%d-%H%M%S.'))
  if l:filename != ''
    execute 'edit ' . l:filename
  endif
endfunction"}}}

" vim-markdown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

" previm settings
autocmd BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Google\ Chrome'
" ctrl pでプレビュー
nnoremap <silent> <C-p> :PrevimOpen<CR>

"open-browser.vim settings
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

"markdown-toc

let g:vmt_auto_update_on_save = 1

