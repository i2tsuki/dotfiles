set noai
set noexpandtab

set list
set listchars=tab:>\ 

syntax on

filetype plugin on
filetype indent on
filetype on

set backup
set backupcopy=yes

map <C-g> :Gtags 
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
