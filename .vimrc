
" enable syntax highlighting
syntax enable

" antialias: use smooth, antialiased fonts
set anti

" autochdir: change directory to the file in the current window
set acd

" autoindent: take indent for new line from previous line
set ai

" autoread: automatically read file when changed outside
set ar

" background: background color used for highlighting
set bg=dark

" nobackup: don't back stuff up
set nobk

" copyindent: copy indent from existing lines
set ci

" hlsearch: highlight matches with the last search pattern
set hls

" history: number of commands remembered
set hi=500

" list: show some hidden characters
set list

" listchars: characters to display in list mode
set lcs=tab:>-,trail:-

" number: print line numbers
set nu

" numberwidth: number of columns for line numbers
set nuw=4

" ruler: show cursor line/column in status line
set ru

" tabstop: number of spaces to use for tabs
set ts=4

" wrap: wrap long lines
set wrap

" wrapmargin: number of characters from right of screen when text should wrap
set wm=1

" automatically wrap text in Git commit messages
autocmd Filetype gitcommit setlocal textwidth=72

" set color scheme
let g:zenburn_high_Contrast = 1
colorscheme zenburn

" associate .js.ejs and .css.ejs extensions with correct filetypes
au BufRead,BufNewFile *.js.ejs setfiletype javascript
au BufRead,BufNewFile *.css.ejs setfiletype css
