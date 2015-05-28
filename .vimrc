set noai
set noexpandtab

syntax on

filetype plugin on
filetype indent on
filetype on

:set list

map <C-g> :Gtags 
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
