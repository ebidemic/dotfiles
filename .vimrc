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
call dein#add('Shougo/vimfiler.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('VimClojure')
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
call dein#add('yuratomo/w3m.vim')
call dein#add('thinca/vim-quickrun')
call dein#add('lervag/vimtex')
call dein#add('TwitVim')
call dein#add('freefem.vim')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

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

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"End dein Scripts-------------------------

"quickrunの設定
let g:quickrun_config = {
            \   "_" :{
            \         "runner" : "vimproc",
            \         "runner/vimproc/updatetime" : 60
            \         },
            \   "tex" : {
            \       'command' : 'latexmk',
            \       "outputter/buffer/split" : ":botright 8sp",
            \       'outputter/error/error' : 'quickfix',
            \       'hook/cd/directory': '%S:h',
            \       'exec': '%c %s'
            \   },
            \}

nnoremap <Leader>q :<C-u>bw! \[quickrun\ output\]<CR>
""
"" Vim-LaTeX
""
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
""let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_CompileRule_pdf = '/Library/TeX/texbin/ptex2pdf -u -l -ot "-synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
"let g:Tex_CompileRule_pdf = '/Library/TeX/texbin/pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = '/Library/TeX/texbin/lualatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = '/Library/TeX/texbin/luajitlatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = '/Library/TeX/texbin/xelatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = '/usr/local/bin/ps2pdf $*.ps'
let g:Tex_CompileRule_ps = '/Library/TeX/texbin/dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_dvi = '/Library/TeX/texbin/uplatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_BibtexFlavor = '/Library/TeX/texbin/upbibtex'
let g:Tex_MakeIndexFlavor = '/Library/TeX/texbin/upmendex $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1
let g:Tex_ViewRule_pdf = 'Skim'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a Skim.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a Preview.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a TeXShop.app'
"let g:Tex_ViewRule_pdf = '/Applications/TeXworks.app/Contents/MacOS/TeXworks'
"let g:Tex_ViewRule_pdf = '/Applications/texstudio.app/Contents/MacOS/texstudio --pdf-viewer-only'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a Firefox.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a "Adobe Reader.app"'
"let g:Tex_ViewRule_pdf = '/usr/bin/open'

"Twitvimの設定

let twitvim_browser_cmd = 'open'
let twitvim_force_ssl = 1
let twitvim_count = 40
